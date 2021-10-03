import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lisa_flutter/main.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/loading_button.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/home/presentation/home_screen.dart';
import 'package:lisa_flutter/src/login/presentation/setup_screen.dart';
import 'package:lisa_flutter/src/login/stores/login_store.dart';
import 'package:lisa_flutter/src/settings/stores/settings_store.dart';
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
      return null;
    }, [store]);

    final theme = Theme.of(context);
    final _primaryColor = theme.primaryColor;
    return Provider.value(
      value: store,
      child: Theme(
        data: ThemeData(
          primarySwatch: createMaterialColor(_primaryColor),
          cupertinoOverrideTheme: CupertinoThemeData(
            brightness: Brightness.light,
            primaryColor: _primaryColor,
          ),
          fontFamily: 'Raleway',
          buttonTheme: ButtonThemeData(
            buttonColor: _primaryColor,
            textTheme: ButtonTextTheme.normal,
          ),
          brightness: Brightness.light,
          primaryColorBrightness: Brightness.dark,
          primaryColor: _primaryColor,
          primaryColorLight: _primaryColor,
          primaryColorDark: _primaryColor,
          indicatorColor: _primaryColor,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: _primaryColor,
            selectionColor: _primaryColor,
            selectionHandleColor: _primaryColor,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              OrientationProxy.isPortrait(context) ? 'assets/images/bg_login_portrait.jpg' : 'assets/images/bg_login_landscape.jpg',
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                alignment: Alignment.center,
                child: Observer(
                  builder: (context) {
                    if (userStore.serverStatus == ServerStatus.noHost) {
                      return _NoHost();
                    }
                    return OrientationProxy(
                      landscapeBuilder: (context) {
                        return _LoginLandscape();
                      },
                      portraitBuilder: (context) {
                        return _LoginPortrait();
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

mixin _LoginFields {
  Widget _getLogo() {
    return Material(
      color: Colors.white.withOpacity(_opacity),
      clipBehavior: Clip.antiAlias,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            200,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: kHugePadding, right: kHugePadding, top: kBigPadding+25, bottom: kNormalPadding),
        child: SvgPicture.asset(
          'assets/images/lisa_full.svg',
          fit: BoxFit.contain,
          width: 190,
        ),
      ),
    );
  }

  Widget _getExternalUrlButtons(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    return Visibility(
      visible: !kIsWeb,
      child: ColoredBox(
        color: Colors.white.withOpacity(_opacity),
        child: TextButton(
          onPressed: () async {
            final bloc = Provider.of<SettingsStore>(context, listen: false);
            final url = await showPrompt(
              context,
              translations.externalUrl,
              hint: translations.externalUrlHint,
              initialValue: bloc.externalBaseUrl,
            );
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
              autofillHints: [AutofillHints.email],
              onChanged: (value) => store.setEmail(value),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: translations.emailField,
                errorText: store.errorState.email?.getMessage(context),
                prefixIcon: Icon(
                  Icons.email,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getFirstNameField(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final store = Provider.of<LoginStore>(context);
    return Container(
      padding: const EdgeInsets.all(kNormalPadding),
      color: Colors.white.withOpacity(_opacity),
      child: HookBuilder(
        builder: (_) {
          final controller = useTextEditingController(text: store.firstName);
          return Observer(
            builder: (context) => TextField(
              autofocus: true,
              controller: controller,
              autofillHints: [AutofillHints.givenName, AutofillHints.middleName],
              onChanged: (value) => store.setFirstName(value),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: translations.firstNameField,
                errorText: store.errorState.firstName?.getMessage(context),
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

  Widget _getLastNameField(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final store = Provider.of<LoginStore>(context);
    return Container(
      padding: const EdgeInsets.all(kNormalPadding),
      color: Colors.white.withOpacity(_opacity),
      child: HookBuilder(
        builder: (_) {
          final controller = useTextEditingController(text: store.lastName);
          return Observer(
            builder: (context) => TextField(
              autofocus: true,
              controller: controller,
              autofillHints: [AutofillHints.familyName],
              onChanged: (value) => store.setLastName(value),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: translations.lastNameField,
                errorText: store.errorState.lastName?.getMessage(context),
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
          autofillHints: [AutofillHints.password],
          textInputAction: TextInputAction.send,
          onSubmitted: (_) {
            FocusScope.of(context).requestFocus(FocusNode());
            login(context);
          },
          style: TextStyle(fontSize: 20),
          onChanged: (value) => store.setPassword(value),
          decoration: InputDecoration(
            labelText: translations.passwordField,
            errorText: store.errorState.password?.getMessage(context),
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
    final userStore = Provider.of<UserStore>(context);
    return Center(
      child: Observer(
        builder: (context) {
          return ProgressButton(
            padding: EdgeInsets.all(kNormalPadding),
            onTap: () => login(context),
            state: store.loginState,
            color: Colors.white.withOpacity(_opacity),
            elevation: 0,
            child: Observer(
              builder: (_) => Text(
                userStore.serverStatus == ServerStatus.initialized ? translations.loginButton.toUpperCase() : translations.signupButton.toUpperCase(),
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
      Navigator.of(context).pushReplacementNamed(HomeScreen.route);
    } on StateError catch (ex, stack) {
      // ignore state errors has it's form errors
    } catch (ex, stack) {
      showErrorDialog(context, ex, stack);
    }
  }
}

class _NoHost extends StatelessWidget with _LoginFields {
  @override
  Widget build(BuildContext context) {
    final localization = CommonLocalizations.of(context);
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 320),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _getLogo(),
          ColoredBox(
            color: Colors.white.withOpacity(_opacity),
            child: Text(
              localization.errorNoHostTitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).errorColor),
            ),
          ),
          ColoredBox(
            color: Colors.white.withOpacity(_opacity),
            child: Padding(
              padding: const EdgeInsets.all(kNormalPadding),
              child: Text(
                kIsWeb ? localization.setupNotSupported : localization.setupDescription,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          if (!kIsWeb)
            ColoredBox(
              color: Colors.white.withOpacity(_opacity),
              child: Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text(localization.setupButton.toUpperCase()),
                  onPressed: () async {
                    final store = Provider.of<LoginStore>(context, listen: false);
                    await Navigator.of(context).pushNamed(SetupScreen.route);
                    store.init(resetHost: true);
                  },
                ),
              ),
            ),
          ColoredBox(
            color: Colors.white.withOpacity(_opacity),
            child: Padding(
              padding: const EdgeInsets.only(top: kNormalPadding, left: kNormalPadding, right: kNormalPadding),
              child: Text(
                localization.errorNoHost,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          _getExternalUrlButtons(context),
          ColoredBox(
            color: Colors.white.withOpacity(_opacity),
            child: Padding(
              padding: const EdgeInsets.only(bottom: kNormalPadding),
              child: Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text(localization.retry.toUpperCase()),
                  onPressed: () {
                    final store = Provider.of<LoginStore>(context, listen: false);
                    store.init(resetHost: true);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginLandscape extends HookWidget with _LoginFields {
  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kNormalPadding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 350),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _getLogo(),
                      _getExternalUrlButtons(context),
                    ],
                  ),
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.transparent,
              width: kNormalPadding,
            ),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 350),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Observer(
                        builder: (context) {
                          if (userStore.serverStatus == ServerStatus.initialized) {
                            return SizedBox(height: 0);
                          }
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _getFirstNameField(context),
                              Divider(color: Colors.transparent, height: 2),
                              _getLastNameField(context),
                              Divider(color: Colors.transparent, height: 2),
                            ],
                          );
                        },
                      ),
                      _getEmailField(context),
                      Divider(color: Colors.transparent, height: 2),
                      _getPasswordField(context),
                      Divider(color: Colors.transparent),
                      _getSubmitButton(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginPortrait extends HookWidget with _LoginFields {
  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(maxWidth: 320),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _getLogo(),
            Divider(color: Colors.transparent, height: 2),
            Observer(
              builder: (context) {
                if (userStore.serverStatus == ServerStatus.initialized) {
                  return SizedBox(height: 0);
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _getFirstNameField(context),
                    Divider(color: Colors.transparent, height: 2),
                    _getLastNameField(context),
                    Divider(color: Colors.transparent, height: 2),
                  ],
                );
              },
            ),
            _getEmailField(context),
            Divider(color: Colors.transparent, height: 2),
            _getPasswordField(context),
            _getExternalUrlButtons(context),
            Divider(color: Colors.transparent),
            _getSubmitButton(context),
          ],
        ),
      ),
    );
  }
}
