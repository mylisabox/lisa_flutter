import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/main.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/loading_button.dart';
import 'package:lisa_flutter/src/common/utils/hooks.dart';
import 'package:lisa_flutter/src/login/bloc/login_bloc.dart';
import 'package:lisa_flutter/src/preferences/bloc/preferences_bloc.dart';
import 'package:provider/provider.dart';
import 'package:proxy_layout/proxy_layout.dart';

class LoginScreen extends HookWidget {
  static const route = 'login';
  final _opacity = .7;

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final bloc = useMemoized(() => LoginBloc());

    useEffect(() {
      bloc.init();
      return null;
    }, [bloc]);

    final theme = Theme.of(context);
    final _primaryColor = theme.primaryColor;
    return Theme(
      data: ThemeData(
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: _primaryColor,
        ),
        fontFamily: 'Raleway',
        brightness: Brightness.light,
        primaryColorBrightness: Brightness.dark,
        accentColorBrightness: Brightness.dark,
        buttonColor: _primaryColor,
        primaryColor: _primaryColor,
        primaryColorLight: _primaryColor,
        primaryColorDark: _primaryColor,
        accentColor: _primaryColor,
        cursorColor: _primaryColor,
        indicatorColor: _primaryColor,
        textSelectionColor: _primaryColor,
        textSelectionHandleColor: _primaryColor,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                OrientationProxy.isPortrait(context) ? 'assets/images/bg_login_portrait.jpg' : 'assets/images/bg_login_landscape.jpg',
                fit: BoxFit.cover,
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(kNormalPadding),
                  constraints: BoxConstraints(maxWidth: 320),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(kNormalPadding),
                        color: Colors.white.withOpacity(_opacity),
                        child: Observer(
                          builder: (_) => HookBuilder(
                            builder: (_) {
                              final controller = useTextEditingController(text: bloc.email);
                              return TextField(
                                autofocus: true,
                                controller: controller,
                                onChanged: (value) => bloc.setEmail(value),
                                onSubmitted: (_) {
                                  FocusScope.of(context).focusInDirection(TraversalDirection.down);
                                },
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                  labelText: translations.emailField,
                                  errorText: bloc.emailError?.getMessage(context),
                                  prefixIcon: Icon(
                                    Icons.person,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Divider(color: Colors.transparent, height: 2),
                      Container(
                        padding: const EdgeInsets.all(kNormalPadding),
                        color: Colors.white.withOpacity(_opacity),
                        child: Observer(
                          builder: (context) => TextField(
                            textInputAction: TextInputAction.send,
                            onSubmitted: (_) async {
                              final isSuccessful = await showLoadingDialog(
                                context,
                                (_) => Text(translations.loginButton),
                                () => bloc.login(),
                                onError: (err) {
                                  showErrorDialog(context, err, null);
                                },
                                barrierDismissible: true,
                              );
                              if (isSuccessful) {
                                Navigator.of(context).pushReplacementNamed(MyHomePage.route);
                              }
                            },
                            style: TextStyle(fontSize: 20),
                            onChanged: (value) => bloc.setPassword(value),
                            decoration: InputDecoration(
                              labelText: translations.passwordField,
                              errorText: bloc.passwordError?.getMessage(context),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () async {
                          final url = await showPrompt(context, translations.externalUrl, hint: translations.externalUrlHint);
                          if (url != null) {
                            Provider.of<PreferencesBloc>(context).setExternalUrl(url);
                          }
                        },
                        child: Text(
                          translations.linkExternalUrl,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Divider(color: Colors.transparent),
                      Container(
                        constraints: BoxConstraints(maxWidth: 320),
                        child: Center(
                          child: ProgressButton(
                            padding: EdgeInsets.all(kNormalPadding),
                            until: () => bloc.login(),
                            onError: (err, stack) {
                              showErrorDialog(context, err, stack);
                            },
                            onSuccess: (_) {
                              Navigator.of(context).pushReplacementNamed(MyHomePage.route);
                            },
                            color: Colors.white.withOpacity(_opacity),
                            elevation: 0,
                            child: Observer(
                              builder: (_) => Text(
                                bloc.mode == AuthMode.login ? translations.loginButton.toUpperCase() : translations.signupButton.toUpperCase(),
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
