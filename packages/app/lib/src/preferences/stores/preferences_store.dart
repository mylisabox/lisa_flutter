import 'package:crypted_preferences/crypted_preferences.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:mobx/mobx.dart';

part 'preferences_store.g.dart';

class PreferencesStore = _PreferencesStore with _$PreferencesStore;

abstract class _PreferencesStore with Store {
  static const _keyDarkTheme = 'darkTheme';
  final Preferences _prefs;
  final BackendApiProvider _apiProvider;
  String externalBaseUrl;

  @observable
  bool isDarkTheme = false;

  _PreferencesStore({Preferences prefs, BackendApiProvider apiProvider})
      : _prefs = prefs ?? PreferencesProvider().prefs,
        _apiProvider = apiProvider ?? BackendApiProvider();

  @action
  void init() {
    isDarkTheme = _prefs.getBool(_keyDarkTheme, defaultValue: false);
    externalBaseUrl = _prefs.getString(PreferencesProvider.keyExternalUrl);
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
    externalBaseUrl = _prefs.getString(PreferencesProvider.keyExternalUrl);
    //clear current host to take the changes into consideration
    (_apiProvider.interceptors.firstWhere((it) => it is HostInterceptor) as HostInterceptor).clearHost();
  }
}
