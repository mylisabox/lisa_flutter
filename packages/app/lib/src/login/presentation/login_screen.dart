import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:lisa_flutter/main.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/loading_button.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/common/utils/hooks.dart';
import 'package:lisa_flutter/src/login/stores/login_store.dart';
import 'package:lisa_flutter/src/preferences/stores/preferences_store.dart';
import 'package:provider/provider.dart';
import 'package:proxy_layout/proxy_layout.dart';

final _opacity = .7;

class LoginScreen extends HookWidget {
  static const route = 'login';

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
    final store = useMemoized(() => LoginStore(
          userStore: userStore,
        ));

    useEffect(() {
      store.init();
      return store.dispose;
    }, [store]);

    final theme = Theme.of(context);
    final _primaryColor = theme.primaryColor;
    return Provider.value(
      value: store,
      child: Theme(
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
          body: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                OrientationProxy.isPortrait(context) ? 'assets/images/bg_login_portrait.jpg' : 'assets/images/bg_login_landscape.jpg',
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.center,
                child: KeyboardAvoider(
                  autoScroll: true,
                  child: OrientationProxy(
                    landscapeBuilder: (context) {
                      return DeviceProxy(
                        tabletBuilder: (_) => _LoginPortrait(),
                        mobileBuilder: (_) => _LoginLandscape(),
                      );
                    },
                    portraitBuilder: (context) {
                      return _LoginPortrait();
                    },
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

abstract class _LoginFields extends HookWidget {
  Widget _getLogo() {
    return Image.asset(
      'assets/images/logo.png',
    );
  }

  Widget _getExternalUrlButtons(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    return FlatButton(
      onPressed: () async {
        final bloc = Provider.of<PreferencesStore>(context, listen: false);
        final url = await showPrompt(context, translations.externalUrl, hint: translations.externalUrlHint, initialValue: bloc.externalBaseUrl);
        if (url != null) {
          bloc.setExternalUrl(url);
        }
      },
      child: Text(
        translations.linkExternalUrl,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _getEmailField(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final store = Provider.of<LoginStore>(context);
    return Container(
      padding: const EdgeInsets.all(kNormalPadding),
      color: Colors.white.withOpacity(_opacity),
      child: HookBuilder(
        builder: (_) {
          final controller = useTextEditingController(text: store.email);
          return Observer(
            builder: (context) => TextField(
              autofocus: true,
              controller: controller,
              onChanged: (value) => store.setEmail(value),
              onSubmitted: (_) {
                FocusScope.of(context).focusInDirection(TraversalDirection.down);
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: translations.emailField,
                errorText: store.emailError?.getMessage(context),
                prefixIcon: Icon(
                  Icons.person,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getPasswordField(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final store = Provider.of<LoginStore>(context);
    return Container(
      padding: const EdgeInsets.all(kNormalPadding),
      color: Colors.white.withOpacity(_opacity),
      child: Observer(
        builder: (context) => TextField(
          textInputAction: TextInputAction.send,
          onSubmitted: (_) {
            FocusScope.of(context).requestFocus(FocusNode());
            login(context);
          },
          style: TextStyle(fontSize: 20),
          onChanged: (value) => store.setPassword(value),
          decoration: InputDecoration(
            labelText: translations.passwordField,
            errorText: store.passwordError?.getMessage(context),
            prefixIcon: Icon(
              Icons.lock_outline,
            ),
          ),
          obscureText: true,
        ),
      ),
    );
  }

  Widget _getSubmitButton(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final store = Provider.of<LoginStore>(context);
    return Center(
      child: Observer(
        builder: (context) {
          return ProgressButton.withState(
            padding: EdgeInsets.all(kNormalPadding),
            onTap: () => login(context),
            state: store.loginState,
            color: Colors.white.withOpacity(_opacity),
            elevation: 0,
            child: Observer(
              builder: (_) => Text(
                store.mode == AuthMode.login ? translations.loginButton.toUpperCase() : translations.signupButton.toUpperCase(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }

  void login(BuildContext context) async {
    final store = Provider.of<LoginStore>(context, listen: false);
    try {
      await store.login();
      Navigator.of(context).pushReplacementNamed(MyHomePage.route);
    } catch (ex, stack) {
      showErrorDialog(context, ex, stack);
    }
  }
}

class _LoginLandscape extends _LoginFields {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kNormalPadding),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _getLogo(),
                _getExternalUrlButtons(context),
              ],
            ),
          ),
          VerticalDivider(
            color: Colors.transparent,
            width: kNormalPadding,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 350),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _getEmailField(context),
                Divider(color: Colors.transparent, height: 2),
                _getPasswordField(context),
                Divider(color: Colors.transparent),
                _getSubmitButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginPortrait extends _LoginFields {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 320),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _getLogo(),
          _getEmailField(context),
          Divider(color: Colors.transparent, height: 2),
          _getPasswordField(context),
          _getExternalUrlButtons(context),
          Divider(color: Colors.transparent),
          _getSubmitButton(context),
        ],
      ),
    );
  }
}
