import 'package:crypted_preferences/crypted_preferences.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:mobx/mobx.dart';

part 'preferences_bloc.g.dart';

class PreferencesBloc = _PreferencesBloc with _$PreferencesBloc;

abstract class _PreferencesBloc with Store {
  static const _keyDarkTheme = 'darkTheme';
  final Preferences _prefs;

  @observable
  bool isDarkTheme = false;

  _PreferencesBloc({Preferences prefs}) : _prefs = prefs ?? PreferencesProvider().prefs;

  @action
  void init() {
    isDarkTheme = _prefs.getBool(_keyDarkTheme, defaultValue: false);
  }

  @action
  void setDarkTheme(bool value) {
    isDarkTheme = value;
    _prefs.setBool(_keyDarkTheme, value);
  }

  @action
  Future setExternalUrl(String value) async {
    if (value == null || value.isEmpty) {
      await _prefs.remove(PreferencesProvider.keyExternalUrl);
    } else {
      await _prefs.setString(PreferencesProvider.keyExternalUrl, value);
    }
  }
}
