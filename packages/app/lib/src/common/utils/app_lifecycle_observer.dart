import 'package:flutter/material.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLifeCycleObserver with WidgetsBindingObserver {
  final SharedPreferences _prefs;
  final void Function() _notAuthenticated;

  AppLifeCycleObserver(this._notAuthenticated, {SharedPreferences? prefs}) : _prefs = prefs ?? PreferencesProvider().prefs;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _prefs.setInt(PreferencesProvider.keyLastSeen, DateTime.now().millisecondsSinceEpoch);
    } else if (state == AppLifecycleState.resumed) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        _checkFingerprint();
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  void _checkFingerprint() async {
    final lastTime = _prefs.getInt(PreferencesProvider.keyLastSeen)!;
    if (DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(lastTime)) > Duration(hours: kHoursBeforeFingerprint)) {
      var localAuth = LocalAuthentication();
      bool didAuthenticate = await localAuth.authenticate(localizedReason: 'Long time no see, please verify yourself');
      if (didAuthenticate) {
        await _prefs.setInt(PreferencesProvider.keyLastSeen, DateTime.now().millisecondsSinceEpoch);
      } else {
        _notAuthenticated();
      }
    }
  }
}
