import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  final BackendApiProvider _apiProvider;
  static const _keyDarkTheme = 'darkTheme';
  final SharedPreferences _prefs;
  late String externalBaseUrl;

  @observable
  bool isDarkTheme = true;

  _SettingsStore({SharedPreferences? prefs, BackendApiProvider? apiProvider})
      : _prefs = prefs ?? PreferencesProvider().prefs,
        _apiProvider = apiProvider ?? BackendApiProvider();

  @action
  void init() {
    isDarkTheme = _prefs.getBool(_keyDarkTheme) ?? isDarkTheme;
    externalBaseUrl = _prefs.getString(PreferencesProvider.keyExternalUrl) ?? '';
  }

  @action
  void setDarkTheme(bool value) {
    isDarkTheme = value;
    _prefs.setBool(_keyDarkTheme, value);
  }

  @action
  Future setExternalUrl(String value) async {
    if (value.isEmpty) {
      await _prefs.remove(PreferencesProvider.keyExternalUrl);
    } else {
      await _prefs.setString(PreferencesProvider.keyExternalUrl, value);
    }
    externalBaseUrl = _prefs.getString(PreferencesProvider.keyExternalUrl) ?? '';
    //clear current host to take the changes into consideration
    (_apiProvider.api.dio.interceptors.firstWhere((it) => it is HostInterceptor) as HostInterceptor).clearHost();
  }

  Future<void> saveVoiceCommandsConfig(Uint8List configFile) async {
    final setupApi = _apiProvider.api.getSetupApi();
    await setupApi.setupVoiceCommand(config: MultipartFile.fromBytes(configFile));
  }
}
