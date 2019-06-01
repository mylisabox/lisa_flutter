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
    final name = locale.countryCode == null || locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) async {
      Intl.defaultLocale = localeName;
      await initializeDateFormatting(Intl.defaultLocale);
      return CommonLocalizations(locale);
    });
  }

  static CommonLocalizations of(BuildContext context) => Localizations.of<CommonLocalizations>(context, CommonLocalizations);

  String get appTitle => Intl.message('L.I.S.A.', name: 'appTitle', desc: 'Action bar title on main screen.');

  String get finished => Intl.message('Finished', name: 'finished', desc: 'Applied to buttons.');

  String get loginButton => Intl.message('Login', name: 'loginButton', desc: 'Login button');

  String get signupButton => Intl.message('Sign up', name: 'signupButton', desc: 'Sign up button');

  String get close => Intl.message('Close', name: 'close', desc: 'Applied to buttons, typically to close a dialog.');

  String get confirm => Intl.message('Confirm', name: 'confirm', desc: 'Applied to buttons.');

  String get copy => Intl.message('Copy', name: 'copy', desc: 'Applied to buttons.');

  String get copied => Intl.message('Copied to clipboard', name: 'copied', desc: 'Applied to snarbar once copy is done.');

  String get retry => Intl.message('Retry', name: 'retry', desc: 'Applied to buttons.');

  String get continueButton => Intl.message('Continue', name: 'continueButton', desc: 'Applied to buttons.');

  String get emptyList => Intl.message('Nothing to show.', name: 'emptyList', desc: 'Displayed when a list is empty and nothing is to display');

  String get pleaseWait => Intl.message('Please wait.', name: 'pleaseWait', desc: 'Something\'s going on!');

  String get undo => Intl.message('Undo', name: 'undo', desc: 'Button label to undo something');

  String get saving => Intl.message('Saving...', name: 'saving', desc: 'Label when saving is ongoing, example save a customer in database');

  String get phoneField => Intl.message('Phone number', name: 'phoneField', desc: 'Phone field label');

  String get emailField => Intl.message('Email', name: 'emailField', desc: 'Email field label');

  String get passwordField => Intl.message('Password', name: 'passwordField', desc: 'Password field label');

  String get passwordConfirmationField => Intl.message('Password confirmation', name: 'passwordConfirmationField', desc: 'Password field label');

  String get nameField => Intl.message('Name', name: 'nameField', desc: 'Name field label');

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

  String get menuFavorite => Intl.message('Favorites', name: 'menuFavorite');

  String get menuLogout => Intl.message('Logout', name: 'menuLogout');

  String get logoutConfirm => Intl.message('Do you really want to log out?', name: 'logoutConfirm');

  String get menuHelp => Intl.message('Help', name: 'menuHelp');

  String get linkExternalUrl => Intl.message('Set external URL for remote access', name: 'linkExternalUrl');

  String get externalUrl => Intl.message('External URL', name: 'externalUrl');

  String get externalUrlHint => Intl.message('http://myDomain.com:3000', name: 'externalUrlHint');

  String get prefLanguage => Intl.message('Language', name: 'prefLanguage');

  String get prefLanguageDesc => Intl.message('Language used on the app and voice commands', name: 'prefLanguageDesc');

  String get profile => Intl.message('Profile', name: 'profile');
  String get firstNameField => Intl.message('First name', name: 'firstNameField');
  String get lastNameField => Intl.message('Last name', name: 'lastNameField');
  String get dialogErrorTitle => Intl.message('Ooops', name: 'dialogErrorTitle');
}

class CommonLocalizationsDelegate extends LocalizationsDelegate<CommonLocalizations> {
  Locale locale;

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
