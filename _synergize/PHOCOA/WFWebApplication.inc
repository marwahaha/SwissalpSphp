<?php
/* vim: set expandtab tabstop=4 shiftwidth=4: */
/* * * *
 * * SssS/_synergize/PHOCOA/WFWebApplication.inc
 * *
 * * based on phocoa/framework/WFWebApplication.php
 * *
 * * adding possibility to also run as CLI app
 * *
 * * @version 20100501_020903 (CC) Luke JZ aka SwissalpS
 * * * */
/**
 * @package WebApplication
 * @copyright Copyright (c) 2005 Alan Pinstein. All Rights Reserved.
 * @version $Id: kvcoding.php,v 1.3 2004/12/12 02:44:09 alanpinstein Exp $
 * @author Alan Pinstein <apinstein@mac.com>
 */

/**
 * BOOTSTRAP function used by the main web page to start our framework.
 * edited by SwissalpS 20100501_021948
 * inits and runs the WFWebApplication with either WFWebApplicationDelegate
 * or SssSApplicationDelegate
 */
function WFWebApplicationMain() {

    $oApp = WFWebApplication::sharedWebApplication();

    if (WFWebApplication::isHTTPRequest()) {

    		$oApp->runWebApplication();

    } else {

    	$oApp->runCLIApplication();

    } // if http or cli request

    return $oApp;

} // WFWebApplicationMain

/**
 * BOOTSTRAP function used by the main web page to start our framework.
 * added by SwissalpS 20100501_021948
 * convenience function
 */
function WFApplicationMain() { return WFWebApplicationMain(); } // WFApplicationMain

function WFPrettyPrint($val) {

    if (is_null($val) || is_scalar($val)) {

        return var_export($val, true);

    } else if (is_object($val) && method_exists($val, '__toString')) {

        return (string) $val;

    } else {

        return print_r($val, true);

    } // if null, scalar, object or any other type

} // WFPrettyPrint

/**
 * The WFWebApplication object is a singleton object that manages the running of the any Phocoa request, be it CLI or HTTP.
 *
 * Right now it doesn't do a whole lot besides manage the shared application object and provide access to a few application defaults via the delegate.
 * Eventually it can be used to manage application-wide settings and state.
 *
 * @tutorial WebApplication.pkg
 */
class WFWebApplication extends WFObject
{
    const DIR_LOG 		        = 1;
    const DIR_RUNTIME 	        = 2;
    const DIR_CLASSES 	        = 3;
    const DIR_SMARTY 	        = 4;
    const DIR_MODULES 	        = 5;
    const DIR_WWW               = 6;
    const DIR_SKINS             = 7;
    const WWW_DIR_BASE          = 100;
    const WWW_DIR_FRAMEWORK     = 101;

    /**
     * @var object The delegate object for the application.
     */
    protected $delegate;
    /**
     * @var array An array containing module location information for modules not in APP_ROOT/modules. Format modulePath => moduleDir [absolute fs path]
     */
    protected $modulePaths;

    /**
     * Constructor
     */
    function __construct() {}

    /**
     * Is the application running in debug mode?
     *
     * You can turn on debug mode by setting a cookie or a request vairable PHOCOA_DEBUG=1
     *
     * @return boolean
     */
    public function debug()
    {
        if (isset($_REQUEST['PHOCOA_DEBUG']))
        {
            $_SESSION['PHOCOA_DEBUG'] = $_REQUEST['PHOCOA_DEBUG'];
        }
        if (isset($_SESSION['PHOCOA_DEBUG']) and $_SESSION['PHOCOA_DEBUG'] == 1)
        {
            return true;
        }
        return false;
    }

    /**
     *  This is the true "setup function"; use this instead of constructor for setup because the object is a singleton with callback,
     *  and down in the call stack of "init" are calls to get the singleton.
     *  If this happens from the constructor, then the singleton accessor is called before it has a chance to save the singleton.
     *
     *  NOTE: assuming right now that this function is called exactly once... thus we use require() instead of require_once() for optimal performance with opcode caches.
     */
    private function init()
    {
        $this->delegate = NULL;
        $this->modulePaths = array();
        if (defined('WEBAPP_DELEGATE'))
        {
            // load delegate
            $delegate_path = APP_ROOT . '/classes/' . WEBAPP_DELEGATE . '.php';
            if ( !file_exists($delegate_path) )
            {
                die("WFWebApplicationDelegate class file cannot be found: $delegate_path");
            }
            // include the application's delegate. This file should load any classes needed by the session.
            require($delegate_path);
            $delegate_class = WEBAPP_DELEGATE;
            if ( !class_exists($delegate_class) )
            {
            	die("WFWebApplicationDelegate class $delegate_class does not exist.");
            }
            $this->delegate = new $delegate_class;

            // @todo THINK ABOUT THIS LIFE-CYCLE.. important things are autoload, singleton/constructor issue, etc
            // just seems weird that sessionDidStart would come AFTER initialize
            // load the session HERE - CANNOT DO THIS VIA AUTOLOAD! EXACT TIMING OF THIS IS VERY IMPORTANT
            $this->sessionWillStart();
            require(FRAMEWORK_DIR . '/framework/WFSession.php');
            $this->initialize();        // this is
            $this->sessionDidStart();   // call this AFTER initialize... so people can hit the DB and such
        }
    }

    /**
     *  This is the true "setup function"; use this instead of constructor for setup because the object is a singleton with callback,
     *  and down in the call stack of "init" are calls to get the singleton.
     *  If this happens from the constructor, then the singleton accessor is called before it has a chance to save the singleton.
     *
     *  NOTE: assuming right now that this function is called exactly once... thus we use require() instead of require_once() for optimal performance with opcode caches.
     */
    private function initCLI() {
        $this->delegate = NULL;
        $this->modulePaths = array();
        if (defined('SssS_APP_DELEGATE'))
        {
            // load delegate
            $delegate_path = APP_ROOT . '/classes/' . SssS_APP_DELEGATE . '.php';
            if ( !file_exists($delegate_path) )
            {
                die("SssSApplicationDelegate class file cannot be found: $delegate_path");
            }
            // include the application's delegate. This file should load any classes needed by the session.
            require($delegate_path);
            $delegate_class = SssS_APP_DELEGATE;
            if ( !class_exists($delegate_class) )
            {
            	die("SssSApplicationDelegate class $delegate_class does not exist.");
            }
            $this->delegate = new $delegate_class;

            // @todo THINK ABOUT THIS LIFE-CYCLE.. important things are autoload, singleton/constructor issue, etc
            // just seems weird that sessionDidStart would come AFTER initialize
            // load the session HERE - CANNOT DO THIS VIA AUTOLOAD! EXACT TIMING OF THIS IS VERY IMPORTANT
            $this->sessionWillStart();
            //require(FRAMEWORK_DIR . '/framework/WFSession.php');
            $this->initialize();        // this is
            $this->sessionDidStart();   // call this AFTER initialize... so people can hit the DB and such
        }
    } // initCLI

    /**
     *  If you have installed modules outside of your project's modules directory, you can tell PHOCOA where to look for them with this function.
     *
     *  Examples:
     *  <code>
     *  WFWebApplication::sharedWebApplication()->addModulePath('login', FRAMEWORK_DIR . '/modules/login');
     *  </code>
     *
     *  @param string The modulePath that must be matched to use the given module.
     *  @param string The absoulte filesystem path of the location of the module.
     */
    function addModulePath($modulePath, $moduleDir)
    {
        $this->modulePaths[$modulePath] = $moduleDir;
    }

    /**
     *  Get the list of extra modules activates for this webapp.
     *
     *  @return array An array of all modulePaths that have been added to this webapp.
     *  @see WFWebApplication::$modulePaths
     */
    function modulePaths()
    {
        return $this->modulePaths;
    }

    /**
     *  Get the delegate for the WFWebApplication.
     *
     *  @return object WFObject An object implementing the {@link WFWebApplicationDelegate} informal protocol.
     */
    function delegate()
    {
        return $this->delegate;
    }

    /**
     * Bootstrap control of the application to the RequestController.
     *
     * The web framework's normal cycle is to instantiate the WFWebApplication then pass control to the WFRequestController to handle the request.
     */
    function runWebApplication()
    {
        $rc = WFRequestController::sharedRequestController();
        $rc->handleHTTPRequest();
    }

    /**
     * Bootstrap control of the application to the RequestController.
     *
     * handle CLI request
     * added by SwissalpS 20100501_023729
     */
    function runCLIApplication() {
        $rc = WFRequestController::sharedRequestController();
        $rc->handleCLIRequest();
    } // runCLIApplication

    /**
     * Get a reference to the shared application object.
     * @static
     * @return object The WFWebApplication object.
     * edited by SwissalpS 20100501_022525 to init differently depending on
     * http request or cli call
     */
    static function sharedWebApplication() {
        static $oApp = NULL;

        if (!$oApp) {
            $oApp = new WFWebApplication();

            if (self::isHTTPRequest()) {

            	$oApp->init();

            } else {

            	$oApp->initCLI();

            } // if http or cli request

        } // first call

        return $oApp;
    } // sharedWebApplication

    /**
     * Get a reference to the shared application object.
     * @static
     * @return object The WFWebApplication object.
     * added by SwissalpS 20100501_022525
     */
    static function sharedApplication() {
    	return self::sharedWebApplication();
    } // sharedCLIApplication

    /**
      * Get the absolute path of one of the application directories.
      *
      * NOTE: this function should only return things inside of APP_ROOT.. presently DIR_SMARTY is an exception b/c we haven't
      * yet implemented userland smarty templates...
      *
      * @param string One of the DIR_* constants.
      * @return string The absolute path of the passed directory type. NO TRAILING SLASH!! ADD IT YOURSELF.
      */
    static function appDirPath($appDirName)
    {
        switch ($appDirName) {
            case self::DIR_LOG:
                return LOG_DIR;
            case self::DIR_RUNTIME:
                return RUNTIME_DIR;
            case self::DIR_CLASSES:
                return APP_ROOT . '/classes';
            case self::DIR_SMARTY:
                return FRAMEWORK_DIR . '/smarty/templates';
            case self::DIR_MODULES:
                return APP_ROOT . '/modules';
            case self::DIR_WWW:
                return APP_ROOT . '/wwwroot/www';
            case self::DIR_SKINS:
                return APP_ROOT . '/skins';
            default:
                throw(new Exception("Unknown app dir: {$appDirName}."));
        }
    }

    /**
     *  Get the www-absolute path of one of the application's public www directories.
     *
     *  @param string One of the WWW_DIR_* constants.
     *  @return string The absolute path to the passed directory type.
     *  @throws
     */
    static function webDirPath($webDirPath)
    {
        switch ($webDirPath) {
            case self::WWW_DIR_BASE:
                return WWW_ROOT . '/www';
            case self::WWW_DIR_FRAMEWORK:
                return WWW_ROOT . '/www/framework/' . PHOCOA_VERSION;
            default:
                throw(new Exception("Unknown web directory: {$webDirPath}."));
        }
    }

    /**
     * Get a cache-busting URL to the given asset path in the www/ directory.
     *
     * @param string A path to the desired asset file relative to the www/ directory.
     * @return string A domain-relative absolute path to the given www asset with a cache-busting query parameter appended.
     * @todo A future version of this might cache-bust with an inline directory version ie /www/v1/... Might be easier to use on the back-end.
     *       Would have to be coordinated with httpd.conf etc
     */
    public static function wwwAssetUrl($wwwAssetPath)
    {
        $fsPath = self::appDirPath(self::DIR_WWW) . "/{$wwwAssetPath}";
        if (!file_exists($fsPath)) throw new WFRequestController_NotFoundException("www asset '{$wwwAssetPath}' does not exist at '{$fsPath}'.");

        $webPath = self::webDirPath(self::WWW_DIR_BASE) . "/{$wwwAssetPath}";
        $fileVersion = date('Ymd-His', filemtime($fsPath));
        return "{$webPath}?{$fileVersion}";
    }

    /** DELEGATE WRAPPER METHODS BELOW */

    /**
     *  Autoload callback for WFWebApplication.
     *
     *  Will allow the app delegate to autoload classes if autoload() is declared in the app delegate.
     *
     *  @param string The class name needing loading.
     *  @return boolean TRUE if the class loading request was handled, FALSE otherwise.
     */
    function autoload($className)
    {
        // let the application try to autoload the class
        if (is_object($this->delegate) && method_exists($this->delegate, 'autoload'))
        {
            $loaded = $this->delegate->autoload($className);
            if ($loaded) return true;
        }
        return false;
    }

    /**
     * Get the default invocationPath for this web application. The default module is the module that will be run if the web root is accessed.
     *
     * The default module is provided by the {@link WFWebApplicationDelegate::defaultInvocationPath()}.
     *
     * @return string The default invocationPath for this web application.
     */
    function defaultInvocationPath()
    {
        if (is_object($this->delegate) && method_exists($this->delegate, 'defaultInvocationPath'))
        {
            return $this->delegate->defaultInvocationPath();
        }
        // support previous defaultModule delegate method too, if the new one isn't there... deprecate this in future
        else if (is_object($this->delegate) && method_exists($this->delegate, 'defaultModule'))
        {
            return $this->delegate->defaultModule();
        }
        return NULL;
    }

    /**
     * Get the default Skin delegate for the application.
     *
     * The default skin delegate is provided by the {@link WFWebApplicationDelegate}.
     *
     * @return object Object implementing the {@link WFSkinDelegate} delegate protocol, or NULL if there is no default delegate.
     */
    function defaultSkinDelegate()
    {
        if (is_object($this->delegate) && method_exists($this->delegate, 'defaultSkinDelegate'))
        {
            return $this->delegate->defaultSkinDelegate();
        }
        return NULL;
    }

    /**
     * Get the default Skin character set.
     *
     * @return object Object implementing the {@link WFSkinDelegate} delegate protocol, or NULL if there is no default delegate.
     */
    function getDefaultCharset()
    {
        if (is_object($this->delegate) && method_exists($this->delegate, 'getDefaultCharset'))
        {
            return $this->delegate->getDefaultCharset();
        }
        return "UTF-8";
    }

    /**
     *  Hook to provide opportunity for the web application to munge the session config before php's session_start() is called.
     */
    function sessionWillStart()
    {
        if (is_object($this->delegate) && method_exists($this->delegate, 'sessionWillStart'))
        {
            $this->delegate->sessionWillStart();
        }
    }
    /**
     *  Hook to provide opportunity for the web application to munge the session data after php's session_start() is called.
     */
    function sessionDidStart()
    {
        if (is_object($this->delegate) && method_exists($this->delegate, 'sessionDidStart'))
        {
            $this->delegate->sessionDidStart();
        }
    }

    /**
     *  Hook to call the initialize method fo the web application.
     *  Applications will typically initialize DB stuff here.
     */
    function initialize()
    {
        if (method_exists($this->delegate, 'initialize'))
        {
            $this->delegate->initialize();
        }
    }

    /**
     *  Hook to call the authorizationInfoClass method fo the web application.
     *  @see WFWebApplicationDelegate::authorizationInfoClass()
     */
    function authorizationInfoClass()
    {
        if (method_exists($this->delegate, 'authorizationInfoClass'))
        {
            return $this->delegate->authorizationInfoClass();
        }
        return 'WFAuthorizationInfo';
    }

    /**
     *  Helper function for encoding URL's in a fashion suitable for passing around as an invocationPath parameter.
     *
     *  This is just base64 modified for URL.
     *
     *  @param string raw data
     *  @return string serialized data string
     *  @see WFWebApplication::unserializeURL()
     */
    public static function serializeURL($url)
    {
        return strtr(base64_encode($url), '+/', '-_');
    }

    /**
     *  Decode data encoded with {@link WFWebApplication::serializeURL() serializeURL}.
     *
     *  @param string serialized data string
     *  @return string raw data
     */
    public static function unserializeURL($data)
    {
        return base64_decode(strtr($data, '-_', '+/'));
    }

    /**
     * Determine if the current execution environment is the result of a WEB request (as oppopsed to a CLI script).
     *
     * @return boolean
     */
    public static function isHTTPRequest()
    {
        return (!in_array(php_sapi_name(), array('cgi', 'cli')));
    }
} //
/* * * *\ WFWebApplication.inc (CC) Luke JZ aka SwissalpS /* * * */
?>
