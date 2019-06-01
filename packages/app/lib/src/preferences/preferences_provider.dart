import 'dart:io';

import 'package:crypted_preferences/crypted_preferences.dart';
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
    if(Platform.isAndroid || Platform.isIOS) {
      final appDocDir = await getApplicationDocumentsDirectory();
      appDocPath = appDocDir.path;
    }

    _prefs = await Preferences.preferences(path: '$appDocPath/prefs.json');
  }
}
