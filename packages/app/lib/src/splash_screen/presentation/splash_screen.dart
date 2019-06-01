import 'package:flare_splash_screen/flare_splash_screen.dart' as flare;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/main.dart';
import 'package:lisa_flutter/src/common/bloc/user_bloc.dart';
import 'package:lisa_flutter/src/login/presentation/login_screen.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class SplashScreen extends HookWidget {
  static const route = 'splashscreen';
  final _logger = Logger('SplashScreen');

  @override
  Widget build(BuildContext context) {
    final userBloc = Provider.of<UserBloc>(context);
    return Container(
      color: Colors.black,
      alignment: Alignment.topCenter,
      child: flare.SplashScreen.callback(
        name: 'assets/animations/intro.flr',
        width: 300,
        loopAnimation: 'loop',
        endAnimation: 'finished',
        onSuccess: (data) {
          if (userBloc.user == null) {
            Navigator.of(context).pushReplacementNamed(LoginScreen.route);
          } else {
            Navigator.of(context).pushReplacementNamed(MyHomePage.route);
          }
        },
        until: () async {
          await userBloc.init();
        },
        onError: (error, stacktrace) {
          _logger.severe('Can\t init the app because  of $error', error, stacktrace);
          Navigator.of(context).pushReplacementNamed(LoginScreen.route);
        },
      ),
    );
  }
}
