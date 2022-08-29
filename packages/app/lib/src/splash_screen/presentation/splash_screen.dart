import 'package:flare_splash_screen/flare_splash_screen.dart' as flare;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/config/routes.dart';
import 'package:lisa_flutter/src/home/presentation/home_screen.dart';
import 'package:lisa_flutter/src/login/presentation/login_screen.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final _logger = Logger('SplashScreen');
class SplashScreen extends HookWidget {
  static const route = 'splashscreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
    return Container(
      color: Colors.black,
      alignment: Alignment.topCenter,
      child: flare.SplashScreen.callback(
        name: 'assets/animations/intro.flr',
        width: 300,
        loopAnimation: 'loop',
        endAnimation: 'finished',
        onSuccess: (data) async {
          if (userStore.user == null) {
            Navigator.of(context).pushReplacementNamed(LoginScreen.route, arguments: RouteArguments());
          } else {
            final lastTime = PreferencesProvider().prefs.getInt(PreferencesProvider.keyLastSeen) ?? DateTime.now().millisecondsSinceEpoch;
            if (DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(lastTime)) > const Duration(hours: kHoursBeforeFingerprint)) {
              var localAuth = LocalAuthentication();
              bool didAuthenticate = await localAuth.authenticate(localizedReason: 'Long time no see, please verify yourself');
              if (didAuthenticate) {
                await PreferencesProvider().prefs.setInt(PreferencesProvider.keyLastSeen, DateTime.now().millisecondsSinceEpoch);
              } else {
                await userStore.logout();
                Navigator.of(context).pushReplacementNamed(LoginScreen.route, arguments: RouteArguments());
              }
            }
            Navigator.of(context).pushReplacementNamed(HomeScreen.route, arguments: RouteArguments());
          }
        },
        until: () async {
          await userStore.init();
        },
        onError: (error, stacktrace) {
          _logger.severe('Can\t init the app because  of $error', error, stacktrace);
          Navigator.of(context).pushReplacementNamed(LoginScreen.route, arguments: RouteArguments());
        },
      ),
    );
  }
}
