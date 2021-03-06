<?php
/* vim: set expandtab tabstop=4 shiftwidth=4: */
/* * * *
 * * WFIncluding.inc
 * *
 * * basically added SwissalpS frameworks that
 * *
 * * @version 20110107_144416 (CC) Luke JZ aka SwissalpS
 * * * */
if (!defined('AUTO_INCLUDING')) define('AUTO_INCLUDING', 'WFIncludingSssS');
/**
 * @package framework-base
 * @copyright Copyright (c) 2005 Alan Pinstein. All Rights Reserved.
 * @version $Id: kvcoding.php,v 1.3 2004/12/12 02:44:09 alanpinstein Exp $
 * @author Alan Pinstein <apinstein@mac.com>
 */

/**
 *  WFIncluding helps PHOCOA improve performance by providing autoload infrastructure.
 */
class WFIncluding {
	/**
	 *  PHOCOA autload callback.
	 *
	 *  This function will load any PHOCOA classes, interfaces, etc.
	 *
	 *  NOTE: autoload() will be called automatically for any new classes, interfaces, etc that are not yet in existence.
	 *
	 *  @param string The className that needs to be loaded.
	 *  @return boolean TRUE if we handled the loading, false otherwise.
	 */
	static public function autoload($sClassName) {
		// I am guessing that using a hashmap will be faster than a big switch statement... no tests yet, but... in any case I'll do it this way first.
		// other option is to add a bunch of paths to include_path, but that seems like a bad idea... YES that's a VERY BAD IDEA. Searching paths is much more expensive
		// than including files directly because it hits the filesystem a lot to find the files.
		static $hAutoloadClassmapCache = NULL;
		static $sPhocoaFWstart = null;
		static $sSssSstart_syn = null;
		static $aDirsToCheck = null;
		static $aSuffixesToTry = null;
		$sRequirePath = null;

		if (NULL == $hAutoloadClassmapCache)
		{

			$sPhocoaFWstart = 'framework' . DIRECTORY_SEPARATOR;
			$sSssSstart_syn = '_synergize' . DIRECTORY_SEPARATOR;

			$hAutoloadClassmapCache = array(
			 	// SwissalpS overrides
			 	// SwissalpS framework etc.
			 	'CustomException'
			 	=> SwissalpS_FRAMEWORK_DIR . '/_external/CustomException.inc',
				'Horde_Yaml'
				=> HORDE_FRAMEWORK_DIR . '/Yaml.php',
				'Horde_Yaml_Dumper'
				=> HORDE_FRAMEWORK_DIR . '/Yaml/Dumper.php',
				'Horde_Yaml_Loader'
				=> HORDE_FRAMEWORK_DIR . '/Yaml/Loader.php',
				'Horde_Yaml_Node'
				=> HORDE_FRAMEWORK_DIR . '/Yaml/Node.php',
				'iphp'
				=> SwissalpS_FRAMEWORK_DIR . '/_external/iPHP/iphp.php',
				'JohnJ_ed25519'
				=> SwissalpS_FRAMEWORK_DIR . '/_external/JohnJ_ed25519.inc',
				'Log'
				=> PEAR_LOG_FRAMEWORK_DIR . '/Log.php',
				'medoo'
				=> SwissalpS_FRAMEWORK_DIR . '/_external/medoo.php',
				'Propel'
				=> PROPEL_FRAMEWORK_DIR . '/Propel.php',
				'SaferScript'
				=> SwissalpS_FRAMEWORK_DIR . '/_external/SaferScript.inc',
				'Smarty'
				=> SMARTY_DIR . 'Smarty.class.php',
			 	'SssSException'
			 	=> '_synergize/PHOCOA/SssSException.inc',
			 	'SssS_ShellScriptRunner'
			 	=> 'SssS_ShellScriptRunner.inc',
			 	'SssS_ShellScriptRunnerForDummies'
			 	=> 'SssS_ShellScriptRunnerForDummies.inc',
			 	'SssS_XHTML'
			 	=> 'SssS_xhtml.inc',
				'WFException'
			 //   => 'framework/WFException.php',
				=> '_synergize/PHOCOA/WFException.inc',
				'WFRequestController'
				=> '_synergize/PHOCOA/WFRequestController.inc',
				'WFRedirectRequestException'
				=> '_synergize/PHOCOA/WFRequestController.inc',
				'WFRequestController_RedirectException'
				=> '_synergize/PHOCOA/WFRequestController.inc',
				'WFRequestController_InternalRedirectException'
				=> '_synergize/PHOCOA/WFRequestController.inc',
				'WFRequestController_NotFoundException'
				=> '_synergize/PHOCOA/WFRequestController.inc',
				'WFRequestController_BadRequestException'
				=> '_synergize/PHOCOA/WFRequestController.inc',
				'WFRequestController_HTTPException'
				=> '_synergize/PHOCOA/WFRequestController.inc',
				'WFSmarty'
				=> '_synergize/PHOCOA/WFSmarty.php',

				// new proposal classes (SwissalpS)
				'WFBundle'
				=> '_synergize/PHOCOA/WFBundle.php',
				'SssSSubmit'
				=> '_synergize/PHOCOA/widgets/SssSSubmit.inc',
				'SssSPaginatorSortLink'
				=> '_synergize/PHOCOA/widgets/SssSPaginatorSortLink.inc',
				'SssSPaginatorPageInfo'
				=> '_synergize/PHOCOA/widgets/SssSPaginatorPageInfo.inc',
				'SssSPaginatorNavigation'
				=> '_synergize/PHOCOA/widgets/SssSPaginatorNavigation.inc',
				'SssSMessageBox'
				=> '_synergize/PHOCOA/widgets/SssSMessageBox.inc',
				'SssSLocalizationTable'
				=> '_synergize/PHOCOA/SssSLocalizationTable.inc',
				'SssSLocalizationHelper'
				=> '_synergize/PHOCOA/SssSLocalizationHelper.inc',
				'SssSLocalizationDelegate'
				=> '_synergize/PHOCOA/SssSLocalizationDelegate.inc',
				'SssSLocalization'
				=> '_synergize/PHOCOA/SssSLocalization.inc',
				'SssSLink'
				=> '_synergize/PHOCOA/widgets/SssSLink.inc',
				'SssSTextField'
				=> '_synergize/PHOCOA/widgets/SssSTextField.inc',
				'SssSLabel'
				=> '_synergize/PHOCOA/widgets/SssSLabel.inc',
				'SssSgdImageBasic'
				=> '_synergize/PHOCOA/SssSgdImageBasic.inc',
				'SssSCheckbox'
				=> '_synergize/PHOCOA/widgets/SssSCheckbox.inc',
				'SssSBlaWidget'
				=> '_synergize/PHOCOA/widgets/SssSBlaWidget.inc',
				'SssSBlaHelper'
				=> '_synergize/PHOCOA/SssSBlaHelper.inc',
				'SssSBla'
				=> '_synergize/PHOCOA/SssSBla.inc',
				'SssSCountries'
				=> '_synergize/PHOCOA/SssSCountries.inc',

				// arbitrary SwissalpS classes

				'SssS_LogRotator'
				=> '_synergize/SssS_LogRotator.inc',

				'SssSMailer'
				=> '_synergize/PHOCOA/SssSMailer.inc',

				'SssSPlistItem'
				=> '_synergize/PHOCOA/SssSPlistItem.inc',
				'SssSPlistItemHelper'
				=> '_synergize/PHOCOA/SssSPlistItem.inc',

				'SssSURLRewrite'
				=> '_synergize/PHOCOA/SssSURLRewrite.php',

			 	// default phocoa
				//'Smarty' => 'Smarty/Smarty.class.php',
				//Horde_Yaml' => 'Horde/Yaml.php', // and others
				'Services_JSON'
				=> 'libs/JSON.php',

				'Mail_Mailer'
				=> 'framework/Mailer.php',

				'WFModel'
				=> 'framework/generator/WFGenerator.php',
				'WFFixture'
				=> 'framework/generator/WFFixture.php',
				'WFYaml'
				=> 'framework/util/WFYaml.php',
				'WFJSON'
				=> 'framework/util/WFJSON.php',
				'WFWebApplication'
				=> 'framework/WFWebApplication.php',
				'WFMenuTree'
				=> 'framework/WFMenuItem.php',
				'WFMenuTreeBuilding'
				=> 'framework/WFMenuItem.php',
				'WFMenuItem'
				=> 'framework/WFMenuItem.php',
				'WFMenuItemBasic'
				=> 'framework/WFMenuItem.php',
				'WFObject'
				=> 'framework/WFObject.php',
				'WFDateTime'
				=> 'framework/WFDateTime.php',
				'WFDecorator'
				=> 'framework/WFDecorator.php',
				'WFKeyValueCoding'
				=> 'framework/WFKeyValueCoding.php',
				'WFKeyValueValidators'
				=> 'framework/util/WFKeyValueValidators.php',
				'WFSkin'
				=> 'framework/WFSkin.php',
				'WFModule'
				=> 'framework/WFModule.php',
				'WFModuleInvocation'
				=> 'framework/WFModule.php',

				// working
				'WFAction'
				=> 'framework/WFRPC.php',
				'WFEvent'
				=> 'framework/WFRPC.php',
				'WFClickEvent'
				=> 'framework/WFRPC.php',
				'WFJSAction'
				=> 'framework/WFRPC.php',
				'WFRPC'
				=> 'framework/WFRPC.php',
				'WFActionResponse'
				=> 'framework/WFRPC.php',
				'WFActionResponsePlain'
				=> 'framework/WFRPC.php',
				'WFActionResponseJSON'
				=> 'framework/WFRPC.php',
				'WFActionResponseXML'
				=> 'framework/WFRPC.php',
				'WFActionResponseJavascript'
				=> 'framework/WFRPC.php',

				'WFPage' =>
				'framework/WFPage.php',
				'WFPageRendering' =>
				'framework/WFPageRendering.php',
				'WFView' =>
				'framework/widgets/WFView.php',
				'WFBinding' =>
				'framework/WFBinding.php',
				'WFBindingSetup' =>
				'framework/WFBinding.php',
				//'WFSmarty' => 'framework/WFSmarty.php',
				'WFAuthorizationDelegate'
				=> 'framework/WFAuthorization.php',
				'WFAuthorizationInfo'
				=> 'framework/WFAuthorization.php',
				'WFAuthorizationException'
				=> 'framework/WFAuthorization.php',
				'WFAuthorizationManager'
				=> 'framework/WFAuthorization.php',
				'WFFormatter'
				=> 'framework/widgets/WFFormatter.php',
				'WFBooleanFormatter'
				=> 'framework/widgets/WFFormatter.php',
				'WFDateTimeFormatter'
				=> 'framework/widgets/WFFormatter.php',
				'WFUNIXDateFormatter'
				=> 'framework/widgets/WFFormatter.php',
				'WFSQLDateFormatter'
				=> 'framework/widgets/WFFormatter.php',
				'WFNumberFormatter'
				=> 'framework/widgets/WFFormatter.php',
				'WFSensitiveDataFormatter'
				=> 'framework/widgets/WFFormatter.php',
				'WFPaginator'
				=> 'framework/WFPagination.php',
				'WFPaginatorException'
				=> 'framework/WFPagination.php',
				'WFPagedArray'
				=> 'framework/WFPagination.php',
				'WFPagedCreoleQuery'
				=> 'framework/WFPagination.php',
				'WFPagedData'
				=> 'framework/WFPagination.php',
				'WFDieselSearch'
				=> 'framework/WFDieselpoint.php',
				'WFDieselSearchHelper'
				=> 'framework/WFDieselpoint.php',
				'WFDieselKeyword'
				=> 'framework/widgets/WFDieselKeyword.php',
				'WFDieselNav'
				=> 'framework/widgets/WFDieselNav.php',
				'WFDieselSearchHelperStateTracking'
				=> 'framework/WFDieselpoint.php',
				'WFDieselFacet'
				=> 'framework/widgets/WFDieselFacet.php',
				'WFWidget'
				=> 'framework/widgets/WFWidget.php',
				'WFDynarchMenu'
				=> 'framework/widgets/WFDynarchMenu.php',
				'WFDynamic'
				=> 'framework/widgets/WFDynamic.php',
				'WFSelectionCheckbox'
				=> 'framework/widgets/WFSelectionCheckbox.php',
				'WFImage'
				=> 'framework/widgets/WFImage.php',
				'WFForm'
				=> 'framework/widgets/WFForm.php',
				'WFAutoForm'
				=> 'framework/widgets/WFAutoForm.php',
				'WFLabel'
				=> 'framework/widgets/WFLabel.php',
				'WFLink'
				=> 'framework/widgets/WFLink.php',
				'WFMessageBox'
				=> 'framework/widgets/WFMessageBox.php',
				'WFPassword'
				=> 'framework/widgets/WFPassword.php',
				'WFTextField'
				=> 'framework/widgets/WFTextField.php',
				'WFSearchField'
				=> 'framework/widgets/WFSearchField.php',
				'WFTextArea'
				=> 'framework/widgets/WFTextArea.php',
				'WFHTMLArea'
				=> 'framework/widgets/WFHTMLArea.php',
				'WFSubmit'
				=> 'framework/widgets/WFSubmit.php',
				'WFSelect'
				=> 'framework/widgets/WFSelect.php',
				'WFJumpSelect'
				=> 'framework/widgets/WFJumpSelect.php',
				'WFTimeSelect'
				=> 'framework/widgets/WFTimeSelect.php',
				'WFHidden'
				=> 'framework/widgets/WFHidden.php',
				'WFSpamHoneypot'
				=> 'framework/widgets/WFSpamHoneypot.php',
				'WFCheckbox'
				=> 'framework/widgets/WFCheckbox.php',
				'WFCheckboxGroup'
				=> 'framework/widgets/WFCheckboxGroup.php',
				'WFRadio'
				=> 'framework/widgets/WFRadio.php',
				'WFRadioGroup'
				=> 'framework/widgets/WFRadioGroup.php',
				'WFUploadError'
				=> 'framework/widgets/WFUploading.php',
				'WFUploaderUtils'
				=> 'framework/widgets/WFUploading.php',
				'WFUploadedFile'
				=> 'framework/widgets/WFUploading.php',
				'WFUploadedFile_Basic'
				=> 'framework/widgets/WFUploading.php',
				'WFUpload'
				=> 'framework/widgets/WFUpload.php',
				'WFPostletUpload'
				=> 'framework/widgets/WFPostletUpload.php',
				'WFHTML5_Uploader'
				=> 'framework/widgets/WFHTML5_Uploader.php',
				'WFBulkUpload'
				=> 'framework/widgets/WFBulkUpload.php',
				'WFBulkUploadFile'
				=> 'framework/widgets/WFBulkUpload.php',
				'WFPaginatorNavigation'
				=> 'framework/widgets/WFPaginatorNavigation.php',
				'WFPaginatorSortLink'
				=> 'framework/widgets/WFPaginatorSortLink.php',
				'WFPaginatorSortSelect'
				=> 'framework/widgets/WFPaginatorSortSelect.php',
				'WFPaginatorState'
				=> 'framework/widgets/WFPaginatorState.php',
				'WFModuleView'
				=> 'framework/widgets/WFModuleView.php',
				'WFTabView'
				=> 'framework/widgets/WFTabView.php',
				'WFTableView'
				=> 'framework/widgets/WFTableView.php',
				'WFAppcelerator'
				=> 'framework/widgets/WFAppcelerator.php',
				'WFBreadCrumb'
				=> 'framework/widgets/WFBreadCrumb.php',
				'WFBreadCrumbSetup'
				=> 'framework/widgets/WFBreadCrumb.php',
				'WFYAHOO'
				=> 'framework/widgets/yahoo/WFYAHOO.php',
				'WFYAHOO_widget_YahooScript'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_YahooScript.php',
				'WFYAHOO_yuiloader'
				=> 'framework/widgets/yahoo/WFYAHOO.php',
				'WFYAHOO_widget_TreeView'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_TreeView.php',
				'WFYAHOO_widget_TreeViewNode'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_TreeView.php',
				'WFYAHOO_widget_Module'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_Module.php',
				'WFYAHOO_widget_Overlay'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_Overlay.php',
				'WFYAHOO_widget_Panel'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_Panel.php',
				'WFYAHOO_widget_Dialog'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_Dialog.php',
				'WFYAHOO_widget_PhocoaDialog'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_PhocoaDialog.php',
				'WFYAHOO_widget_Logger'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_Logger.php',
				'WFYAHOO_widget_Menu'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_Menu.php',
				'WFYAHOO_widget_AutoComplete'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_AutoComplete.php',
				'WFYAHOO_widget_Tab'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_TabView.php',
				'WFYAHOO_widget_TabView'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_TabView.php',
				'WFYAHOO_widget_ColorPicker'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_ColorPicker.php',
				'WFYAHOO_widget_Calendar'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_Calendar.php',
				'WFYAHOO_widget_DateTimePicker'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_DateTimePicker.php',
				'WFYAHOO_widget_Uploader'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_Uploader.php',
				'WFYAHOO_widget_Carousel'
				=> 'framework/widgets/yahoo/WFYAHOO_widget_Carousel.php',
				'WFPaginatorPageInfo'
				=> 'framework/widgets/WFPaginatorPageInfo.php',
				'WFValueTransformer'
				=> 'framework/ValueTransformers/WFValueTransformer.php',
				'WFNegateBooleanTransformer'
				=> 'framework/ValueTransformers/WFNegateBooleanTransformer.php',
				'WFIsEmptyTransformer'
				=> 'framework/ValueTransformers/WFIsEmptyTransformer.php',
				'WFEmptyToNullTransformer'
				=> 'framework/ValueTransformers/WFEmptyToNullTransformer.php',
				'WFIsNotEmptyTransformer'
				=> 'framework/ValueTransformers/WFIsNotEmptyTransformer.php',
				'WFUrlencodeTransformer'
				=> 'framework/ValueTransformers/WFUrlencodeTransformer.php',
				'WFObjectController'
				=> 'framework/WFObjectController.php',
				'WFArrayController'
				=> 'framework/WFArrayController.php',
				'WFArray'
				=> 'framework/WFArray.php',
				'WFDictionary'
				=> 'framework/WFDictionary.php',
				'WFError'
				=> 'framework/WFError.php',
				'WFErrorArray'
				=> 'framework/WFError.php',
				'WFErrorsException'
				=> 'framework/WFError.php',
				'WFErrorCollection'
				=> 'framework/WFError.php',
				'WFExceptionReporting'
				=> 'framework/WFExceptionReporting.php',
				'WFFunction'
				=> 'framework/WFFunction.php',
				'WFUnixDateFormatter'
				=> 'framework/widgets/WFFormatter.php',
				'WFSQLDateFormatter'
				=> 'framework/widgets/WFFormatter.php',
				'WFNumberFormatter'
				=> 'framework/widgets/WFFormatter.php',
				'FCKEditor'
				=> FRAMEWORK_DIR . '/wwwroot/www/framework/FCKEditor/fckeditor.php',

				// propel
				'WFPagedPropelQuery'
				=> 'framework/WFPagination.php',
				'WFPagedPropelModelCriteria'
				=> 'framework/WFPagination.php',
				'WFModelBuilderPropel'
				=> 'framework/generator/WFGeneratorPropel12_13.php',
				'WFModelBuilderPropel15'
				=> 'framework/generator/WFGeneratorPropel15.php',
				'WFPropelException'
				=> 'framework/util/WFPropelIntegration.php',
				'WFObject_Propel'
				=> 'framework/util/WFPropelIntegration.php',

				// PHPUnit
				'PhocoaControllerTestCase_PHPUnit' => 'phpunit/PhocoaControllerTestCase_PHPUnit.php',
			);

			// windows box or other non posix '\\'
			str_replace(array('/', '\\'), DIR_SEP, $hAutoloadClassmapCache);
		} // if not yet built cache map

		if (isset($hAutoloadClassmapCache[$sClassName])) {
			// including absolute paths is much faster than relative paths to the include_path dirs because one doesn't have to walk the include path.
			// so, if it's a framework/ dir, then include it absolutely! Otherwise, let require figure it out.
			$sRequirePath = $hAutoloadClassmapCache[$sClassName];
			if ($sPhocoaFWstart == substr($sRequirePath, 0, 10))
					$sRequirePath = FRAMEWORK_DIR . DIR_SEP . $sRequirePath;

			else if ($sSssSstart_syn == substr($sRequirePath, 0, 11))
					$sRequirePath = SwissalpS_FRAMEWORK_DIR
							. DIRECTORY_SEPARATOR . $sRequirePath;

			else if ('SssS' == substr($sClassName, 0, 4))
					$sRequirePath = SwissalpS_FRAMEWORK_DIR
							. DIRECTORY_SEPARATOR . $sRequirePath;

		} // if got cached path
		else if ('SssS' == substr($sClassName, 0, 4)) {
			// TODO: check if this is sufficient
			if (!$aDirsToCheck) {
				$aSuffixesToTry = array('.inc', '.liz', '.zil', '.php', '.tmf');
				$aDirsToCheck = array(
					SwissalpS_FRAMEWORK_DIR . DIR_SEP,
					APP_ROOT . DIR_SEP . 'classes' . DIR_SEP);
			} // if got cached

			foreach ($aDirsToCheck as $sDir) {
				$sTestPathWithoutSuffix = $sDir . $sClassName;
				foreach ($aSuffixesToTry as $sSuffix) {
					if (is_file($sTestPathWithoutSuffix . $sSuffix)) {
						$sRequirePath = $sTestPathWithoutSuffix . $sSuffix;
						require($sRequirePath);
						return true;
					} // if found a file
				} // foreach suffix
			} // foreach dir

		} // if starts with SssS -> probably from SwissalpS

		if (null !== $sRequirePath) { require($sRequirePath); return true; }

		if (is_file(APP_ROOT . DIR_SEP . 'classes'
									. DIR_SEP . $sClassName . '.php')) {
			$sRequirePath = APP_ROOT . DIR_SEP . 'classes'
									. DIR_SEP . $sClassName . '.php';
			require($sRequirePath);
			return true;
		} // if in apps root classes

		// give appdelegate a shot at it
		$oApp = WFWebApplication::sharedWebApplication();
		return $oApp->autoload($sClassName);
	} // autoload
} // WFIncluding
/* * * *\ WFIncluding.inc (CC) Luke JZ aka SwissalpS /* * * */
?>
