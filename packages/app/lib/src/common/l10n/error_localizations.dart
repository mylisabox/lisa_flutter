import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lisa_flutter/src/common/constants.dart';

import 'messages/messages_all.dart';

class ErrorLocalizations {
  final Locale locale;

  ErrorLocalizations(this.locale);

  static Future<ErrorLocalizations> load(Locale locale) {
    final name = locale.countryCode == null || locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      return ErrorLocalizations(locale);
    });
  }

  static ErrorLocalizations of(BuildContext context) => Localizations.of<ErrorLocalizations>(context, ErrorLocalizations)!;

  String get dialogErrorTitle => Intl.message('Oops!', name: 'dialogErrorTitle', desc: 'The title of a dialog where something went wrong');

  String get wrongEmailMessage => Intl.message('Email is not correct', name: 'wrongEmailMessage');

  String get internalHint => Intl.message('There is nothing you can do, we\'ll try to fix this asap', name: 'internalHint');
  String get internalMessage => Intl.message('An error as occured', name: 'internalMessage');

  String get noNetworkHint => Intl.message('Try again later when you have better coverage', name: 'noNetworkHint');
  String get noNetworkMessage => Intl.message('Device seems to be offline', name: 'noNetworkMessage');

  String get noAppForTheAction => Intl.message('No application available for this action',
      name: 'noAppForTheAction', desc: 'Displayed when no app can handle the wanted action (send sms, email, open web page...)');
  String get noAppForTheActionHint => Intl.message('Try to install an application who handle this kind of action',
      name: 'noAppForTheActionHint', desc: 'Displayed when no app can handle the wanted action (send sms, email, open web page...)');

  String get fieldRequired => Intl.message('This field is required', name: 'fieldRequired', desc: 'When a field is required on a form');
  String get fieldRequiredHint => Intl.message('Please fill this field', name: 'fieldRequiredHint', desc: 'When a field is required on a form');

  String get notLogged => Intl.message('Look like you\'re not logged', name: 'notLogged', desc: 'When a 401 occurred');
  String get notLoggedHint => Intl.message('Please log in before doing this action', name: 'notLoggedHint', desc: 'When a 401 occurred');

  String get forbidden => Intl.message('Look like this action is forbidden', name: 'forbidden', desc: 'When a 403 occurred');
  String get forbiddenHint => Intl.message('Please retry when log in with a user with different permissions', name: 'forbiddenHint', desc: 'When a 403 occurred');

  String get wrongCredentials => Intl.message('Login failed', name: 'wrongCredentials', desc: 'When login credentials are wrong');
  String get wrongCredentialsHint => Intl.message('Please check your email and password and retry', name: 'wrongCredentialsHint', desc: 'When login credentials are wrong');
}

class ErrorLocalizationsDelegate extends LocalizationsDelegate<ErrorLocalizations> {
  late Locale locale;
  ErrorLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => kSupportedLanguages.contains(locale);

  @override
  Future<ErrorLocalizations> load(Locale locale) {
    this.locale = locale;
    return ErrorLocalizations.load(locale);
  }

  @override
  bool shouldReload(ErrorLocalizationsDelegate old) => old.locale != locale;
}
