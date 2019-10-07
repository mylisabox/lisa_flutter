import 'package:crypted_preferences/crypted_preferences.dart';
import 'package:lisa_flutter/src/common/utils/directory_provider/directory_provider.dart';

class PreferencesProvider {
  static const keyExternalUrl = 'externalUrl';
  static const keyLastRoute = 'lastRoute';
  static const keyToken = 'token';
  static PreferencesProvider _singleton;

  PreferencesProvider._();

  factory PreferencesProvider() {
    return _singleton ??= PreferencesProvider._();
  }

  Preferences _prefs;

  Preferences get prefs => _prefs;

  Future<void> setup() async {
    String appDocPath = await kGetMainDirectory();
    _prefs = await Preferences.preferences(path: '$appDocPath/prefs.json');
  }
}
