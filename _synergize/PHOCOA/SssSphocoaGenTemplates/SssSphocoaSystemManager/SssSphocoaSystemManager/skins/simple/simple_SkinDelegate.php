<?php

// custom skin delegates
class simple_SkinDelegate {

    function loadDefaults($oSkin) {

        // look at URL and determine skin.
        $oSkin->setSkin('sidenav');
        $oSkin->setTheme('brushed');

        // set up other skin defaults
        $oSkin->setMetaDescription('PHOCOA Skin Type based on YUI CSS principles.');
        $oSkin->addMetaKeywords(array('yui, yui css, yahoo css'));
        $oSkin->setTitle('YUI Skin for PHOCOA');

		$oSkin->addHeadString('<link rel="stylesheet" type="text/css" href="' . $oSkin->getSkinDir() . '/SssSBla.css" />');

    } // loadDefaults


    /**
      * The namedContent mechanism for our skin. Here is the catalog:
      *
      * mainMenu - An associative array of links ('link name' => 'link url') for the header area.
      * copyright - a copyright notice, as a string.
      *
      */
    function namedContent($name, $options = NULL) {

        switch ($name) {
            case 'mainMenu':
                return array(
                        'Widget Examples Reference' => WFRequestController::WFURL('examples/widgets/toc'),
                        'Email' => WFRequestController::WFURL('examples/emailform'),
                        'phpinfo' => WFRequestController::WFURL('examples/phpinfo'),
                        'Skin Info' => WFRequestController::WFURL('examples/skininfo'),
                        );
                break;
            case 'copyright':
                return "&copy; 2005-" . date('Y') . " Alan Pinstein. All Rights Reserved.";
                break;
        }

    } // namedContent


    function namedContentList() {

        return array('mainMenu', 'copyright');

    } // namedContentList

} // simple_SkinDelegate

?>
