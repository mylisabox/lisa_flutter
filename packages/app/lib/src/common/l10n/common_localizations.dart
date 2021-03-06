import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:lisa_flutter/src/common/constants.dart';

import 'messages/messages_all.dart';

class CommonLocalizations {
  final Locale locale;

  CommonLocalizations(this.locale);

  static Future<CommonLocalizations> load(Locale locale) {
    final name = locale.countryCode == null || locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) async {
      Intl.defaultLocale = localeName;
      await initializeDateFormatting(Intl.defaultLocale);
      return CommonLocalizations(locale);
    });
  }

  static CommonLocalizations of(BuildContext context) => Localizations.of<CommonLocalizations>(context, CommonLocalizations)!;

  String get appTitle => Intl.message('L.I.S.A.', name: 'appTitle', desc: 'Action bar title on main screen.');

  String get rename => Intl.message('Rename', name: 'rename', desc: 'Rename action.');

  String get renaming => Intl.message('Renaming...', name: 'renaming', desc: 'Rename action.');

  String get delete => Intl.message('Delete', name: 'delete', desc: 'Delete action.');

  String get finished => Intl.message('Finished', name: 'finished', desc: 'Applied to buttons.');

  String get addDevice => Intl.message('Add new device...', name: 'addDevice', desc: 'Add device popup title.');

  String addDeviceTo(String room) => Intl.message('Add new device to $room', args: [room], name: 'addDeviceTo', desc: 'Add device popup title.');

  String get loginButton => Intl.message('Login', name: 'loginButton', desc: 'Login button');

  String get signupButton => Intl.message('Sign up', name: 'signupButton', desc: 'Sign up button');

  String get close => Intl.message('Close', name: 'close', desc: 'Applied to buttons, typically to close a dialog.');

  String get cancel => Intl.message('Cancel', name: 'cancel', desc: 'Applied to buttons, typically to cancel a dialog.');

  String get save => Intl.message('Save', name: 'save', desc: 'Applied to buttons, typically to save something.');

  String get confirm => Intl.message('Confirm', name: 'confirm', desc: 'Applied to buttons.');

  String get copy => Intl.message('Copy', name: 'copy', desc: 'Applied to buttons.');

  String get copied => Intl.message('Copied to clipboard', name: 'copied', desc: 'Applied to snarbar once copy is done.');

  String get retry => Intl.message('Retry', name: 'retry', desc: 'Applied to buttons.');

  String get continueButton => Intl.message('Continue', name: 'continueButton', desc: 'Applied to buttons.');

  String get emptyList => Intl.message('Nothing to show.', name: 'emptyList', desc: 'Displayed when a list is empty and nothing is to display');

  String get selectAll => Intl.message('Select all', name: 'selectAll', desc: 'Select all in checkbox lists');

  String get pleaseWait => Intl.message('Please wait.', name: 'pleaseWait', desc: 'Something\'s going on!');

  String get undo => Intl.message('Undo', name: 'undo', desc: 'Button label to undo something');

  String get saving => Intl.message('Saving...', name: 'saving', desc: 'Label when saving is ongoing, example save a customer in database');

  String get deleting => Intl.message('Deleting...', name: 'deleting', desc: 'Label when deleting is ongoing, example delete a customer in database');

  String get profileSaved => Intl.message('Profil successfully saved!', name: 'profileSaved', desc: 'Profile saved message');

  String get phoneField => Intl.message('Phone number', name: 'phoneField', desc: 'Phone field label');

  String get emailField => Intl.message('Email', name: 'emailField', desc: 'Email field label');

  String get passwordField => Intl.message('Password', name: 'passwordField', desc: 'Password field label');

  String get passwordConfirmationField => Intl.message('Password confirmation', name: 'passwordConfirmationField', desc: 'Password field label');

  String get nameField => Intl.message('Name', name: 'nameField', desc: 'Name field label');

  String get actions => Intl.message('Actions', name: 'actions');

  String get colorField => Intl.message('Color', name: 'colorField', desc: 'Color field label');

  String get search => Intl.message('Search', name: 'search', desc: 'Hint under search field');

  String get deleteAction => Intl.message('Delete', name: 'deleteAction', desc: 'Delete label on button, swipe action');

  String get editAction => Intl.message('Edit', name: 'editAction', desc: 'Edit label on button, swipe action');

  String get favoriteAction => Intl.message('Favorite', name: 'favoriteAction', desc: 'Favorite label on button, swipe action');

  String get success => Intl.message('Success', name: 'success', desc: 'Success general label');

  String get helpIntro =>
      Intl.message('If you have questions regarding the application or if you want to know more about KiWi, do not hesitate to get in touch with us.',
          name: 'helpIntro');

  String get helpFooter => Intl.message('We look forward to hearing from you!', name: 'helpFooter');

  String get helpEmail => Intl.message('ayuda@kiwi-bop.com', name: 'helpEmail');

  String helpVersion(version, buildNumber) =>
      Intl.message('Version $version, build $buildNumber', name: 'helpVersion', args: [version, buildNumber], desc: 'Displayed on the support page');

  String get menuWelcome => Intl.message('Welcome to L.I.S.A.', name: 'menuWelcome', desc: 'The title of the menu drawer');

  String get menuNightMode => Intl.message('Night mode', name: 'menuNightMode');

  String get menuRooms => Intl.message('Rooms', name: 'menuRooms');

  String get menuAddRoom => Intl.message('Add new room', name: 'menuAddRoom');

  String get menuOrphans => Intl.message('Orphans', name: 'menuOrphans');

  String get menuPreferences => Intl.message('Preferences', name: 'menuPreferences');

  String get menuSettings => Intl.message('Settings', name: 'menuSettings');

  String get menuScenes => Intl.message('Scenes', name: 'menuScenes');

  String get menuMultimedia => Intl.message('Multimedia', name: 'menuMultimedia');

  String get menuMultimediaSickChill => Intl.message('SickChill', name: 'menuMultimediaSickChill');

  String get menuMultimediaTransmission => Intl.message('Transmission', name: 'menuMultimediaTransmission');

  String get menuFavorite => Intl.message('Favorites', name: 'menuFavorite');

  String get menuLogout => Intl.message('Logout', name: 'menuLogout');

  String get logoutConfirm => Intl.message('Do you really want to log out?', name: 'logoutConfirm');

  String get menuHelp => Intl.message('Help', name: 'menuHelp');

  String get linkExternalUrl => Intl.message('Set external URL for remote access', name: 'linkExternalUrl');

  String get externalUrl => Intl.message('External URL', name: 'externalUrl');

  String get externalUrlHint => Intl.message('http://myDomain.com:3000', name: 'externalUrlHint');

  String get voiceCommand => Intl.message('Setup voice commands', name: 'voiceCommand');

  String get voiceCommandDesc => Intl.message('Send your google config file to L.I.S.A. to be able to use voice commands', name: 'voiceCommandDesc');

  String get prefLanguage => Intl.message('Language', name: 'prefLanguage');

  String get prefLanguageDesc => Intl.message('Language used on the app and voice commands', name: 'prefLanguageDesc');

  String get profile => Intl.message('Profile', name: 'profile');

  String get addScene => Intl.message('Add new scene', name: 'addScene');

  String get firstNameField => Intl.message('First name', name: 'firstNameField');

  String get lastNameField => Intl.message('Last name', name: 'lastNameField');

  String get dialogErrorTitle => Intl.message('Ooops', name: 'dialogErrorTitle');

  String get sceneCommandsTitle => Intl.message('Voice commands', name: 'sceneCommandsTitle');

  String get sceneResponsesTitle => Intl.message('Responses', name: 'sceneResponsesTitle');

  String get sceneActionsTitle => Intl.message('Actions', name: 'sceneSentencesTitle');

  String get sceneAddSentence => Intl.message('Add sentence', name: 'sceneAddSentence');

  String get sceneAddResponse => Intl.message('Add response', name: 'sceneAddResponse');

  String get sceneAddCommand => Intl.message('Add command', name: 'sceneAddCommand');

  String get deleteConfirm => Intl.message('Are you sure you want to delete this item ?', name: 'deleteConfirm');

  String deleteItem(String name) => Intl.message('Delete $name', args: [name], name: 'deleteItem');

  String get selectRoom => Intl.message('Select room', name: 'selectRoom');

  String get errorNoHostTitle => Intl.message('No L.I.S.A. server has been found.', name: 'errorNoHostTitle');

  String get errorNoHost => Intl.message('Please check/set an external URL or make sure you\'re on same network as the server.', name: 'errorNoHost');

  String get setupTitle => Intl.message('Setup', name: 'setupTitle');

  String get setupButton => Intl.message('Setup a new L.I.S.A.', name: 'setupButton');

  String get setupDescription => Intl.message('You can setup your new L.I.S.A. box now or retry the search', name: 'setupDescription');

  String get setupNotSupported => Intl.message('If you need to setup a new L.I.S.A. box please use the mobile application to do it as it need Bluetooth to do it.', name: 'setupNotSupported');

  String get btConnecting => Intl.message('Searching and connecting to a near L.I.S.A. instance', name: 'btConnecting');

  String get networkSearching => Intl.message('Searching for remote networks available to L.I.S.A.', name: 'networkSearching');

  String get networkSaving => Intl.message('Saving network to L.I.S.A.', name: 'networkSaving');

  String get noDeviceFound => Intl.message('No L.I.S.A. instance found, be sure you plug it and it blink in yellow', name: 'noDeviceFound');

  String get searchingBTDevice => Intl.message('Your box should currently blink in yellow, if it\'s not the case please replug it.\n\nOnce it blink launch a search to connect to it and setup the WiFi network.', name: 'searchingBTDevice');

  String get voiceCommandSetupTitle => Intl.message('Choose configuration file', name: 'voiceCommandSetupTitle');

  String get chooseFileButton => Intl.message('Choose file', name: 'chooseFileButton');

  String chosenFile(String name) => Intl.message('Chosen file: $name', args: [name], name: 'chosenFile');

  String get voiceCommandSetupDesc => Intl.message('To enable voice commands for L.I.S.A. you need to provide a Google configuration file (JSON file).', name: 'voiceCommandSetupDesc');

  String get pluginShop => Intl.message('Plugins', name: 'pluginShop');

  String installPluginDesc(String plugin) => Intl.message('Are you sure to install $plugin ?', args: [plugin], name: 'installPluginDesc');

  String get installPlugin => Intl.message('Install', name: 'installPlugin');

  String uninstallPluginDesc(String plugin) => Intl.message('Are you sure to uninstall $plugin ?', args: [plugin], name: 'uninstallPluginDesc');

  String get uninstallPlugin => Intl.message('Uninstall', name: 'uninstallPlugin');

  String get pluginShopDesc => Intl.message('Install or uninstall L.I.S.A. plugins', name: 'pluginShopDesc');

  String get boxConnected =>
      Intl.message('Your box is now connected and should blink in blue, meaning you can use L.I.S.A. but can\'t do voice commands until you setup it.',
          name: 'boxConnected');

  String networkPasswordTitle(String ssid) => Intl.message('Password for $ssid', name: 'networkPasswordTitle', args: [ssid]);
}

class CommonLocalizationsDelegate extends LocalizationsDelegate<CommonLocalizations> {
  Locale? locale;

  CommonLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => kSupportedLanguages.contains(locale);

  @override
  Future<CommonLocalizations> load(Locale locale) {
    this.locale = locale;
    return CommonLocalizations.load(locale);
  }

  @override
  bool shouldReload(CommonLocalizationsDelegate old) => old.locale != locale;
}
