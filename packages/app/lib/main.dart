import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart' as platform;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/bloc/speech_bloc.dart';
import 'package:lisa_flutter/src/common/bloc/user_bloc.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/l10n/error_localizations.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/presentation/proxy_scaffold.dart';
import 'package:lisa_flutter/src/common/presentation/speech_button.dart';
import 'package:lisa_flutter/src/common/utils/logging.dart';
import 'package:lisa_flutter/src/config/routes.dart';
import 'package:lisa_flutter/src/drawer/bloc/drawer_bloc.dart';
import 'package:lisa_flutter/src/drawer/presentation/drawer.dart';
import 'package:lisa_flutter/src/favorites/presentation/favorites.dart';
import 'package:lisa_flutter/src/preferences/bloc/preferences_bloc.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:lisa_flutter/src/splash_screen/presentation/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsMobile()) {
    platform.debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia; //FIXME remove when desktop/web are detected and supported
  }
  await PreferencesProvider().setup();
  BackendApiProvider.setup();
  initLogger();

  runApp(MyApp());
}

class MyApp extends HookWidget {
  static const _primaryColor = Color(0xff1bbc9b);

  @override
  Widget build(BuildContext context) {
    final prefBloc = useMemoized(() => PreferencesBloc());
    final drawerBloc = useMemoized(() => DrawerBloc());
    final userBloc = useMemoized(() => UserBloc());

    useEffect(() {
      prefBloc.init();
      return null;
    }, [prefBloc]);

    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        Provider(
          builder: (_) => drawerBloc,
          dispose: (_, userBloc) => drawerBloc.dispose(),
        ),
        Provider(
          builder: (_) => userBloc,
          dispose: (_, userBloc) => userBloc.dispose(),
        ),
        Provider(
          builder: (_) => prefBloc,
          dispose: (_, prefBloc) => prefBloc.dispose(),
        ),
      ],
      child: Observer(
        builder: (context) {
          var locale;

          if (userBloc.lang != null) {
            locale = kSupportedLanguages.firstWhere((locale) => locale.languageCode == userBloc.lang, orElse: () => null);
          }

          return MaterialApp(
            title: 'L.I.S.A.',
            locale: locale,
            localizationsDelegates: [
              CommonLocalizationsDelegate(),
              ErrorLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: kSupportedLanguages,
            theme: ThemeData(
              cupertinoOverrideTheme: CupertinoThemeData(
                brightness: prefBloc.isDarkTheme ? Brightness.dark : Brightness.light,
                primaryColor: _primaryColor,
              ),
              fontFamily: 'Raleway',
              brightness: prefBloc.isDarkTheme ? Brightness.dark : Brightness.light,
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
            initialRoute: SplashScreen.route,
            onGenerateRoute: Router().onGenerateRoute,
          );
        },
      ),
    );
  }
}

class MyHomePage extends HookWidget {
  static const route = 'home';

  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = useMemoized(() => SpeechBloc());
    return ProxyScaffold(
      floatingActionButton: kIsMobile()
          ? SpeechButton(
              onResults: (text) async {
                final response = await bloc.sendSentence(text, Localizations.localeOf(context).languageCode);
                Toast.show(response, context, duration: Toast.LENGTH_LONG);
              },
            )
          : null,
      builderDrawer: (context) => AppDrawer(),
      initialRoute: FavoritesWidget.route,
    );
  }
}
