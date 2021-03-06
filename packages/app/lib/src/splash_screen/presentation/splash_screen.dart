import 'package:flare_splash_screen/flare_splash_screen.dart' as flare;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/main.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/config/routes.dart';
import 'package:lisa_flutter/src/login/presentation/login_screen.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class SplashScreen extends HookWidget {
  static const route = 'splashscreen';
  final _logger = Logger('SplashScreen');

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
        onSuccess: (data) {
          if (userStore.user == null) {
            Navigator.of(context).pushReplacementNamed(LoginScreen.route, arguments: FadePageRouteArguments());
          } else {
            Navigator.of(context).pushReplacementNamed(MyHomePage.route, arguments: FadePageRouteArguments());
          }
        },
        until: () async {
          await userStore.init();
        },
        onError: (error, stacktrace) {
          _logger.severe('Can\t init the app because  of $error', error, stacktrace);
          Navigator.of(context).pushReplacementNamed(LoginScreen.route, arguments: FadePageRouteArguments());
        },
      ),
    );
  }
}
