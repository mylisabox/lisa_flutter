import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider {
  static const keyExternalUrl = 'externalUrl';
  static const keyLastRoute = 'lastRoute';
  static const keyToken = 'token';
  static const keyLastSeen = 'lastSeen';
  static const keyRefreshToken = 'refreshToken';
  static PreferencesProvider? _singleton;

  final securePrefs = const FlutterSecureStorage();

  PreferencesProvider._();

  factory PreferencesProvider() {
    return _singleton ??= PreferencesProvider._();
  }

  late SharedPreferences _prefs;

  SharedPreferences get prefs => _prefs;

  Future<void> setup() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
