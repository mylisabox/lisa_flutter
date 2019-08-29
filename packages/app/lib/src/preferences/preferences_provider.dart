import 'package:crypted_preferences/crypted_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class PreferencesProvider {
  static const keyExternalUrl = 'externalUrl';
  static const keyToken = 'token';
  static PreferencesProvider _singleton;

  PreferencesProvider._();

  factory PreferencesProvider() {
    return _singleton ??= PreferencesProvider._();
  }

  Preferences _prefs;

  Preferences get prefs => _prefs;

  Future<void> setup() async {
    String appDocPath = '.';
    if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
      final appDocDir = await getApplicationDocumentsDirectory();
      appDocPath = appDocDir.path;
    }

    _prefs = await Preferences.preferences(path: '$appDocPath/prefs.json');
  }
}
