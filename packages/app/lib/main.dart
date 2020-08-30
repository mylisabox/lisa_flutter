import 'package:flutter/cupertino.dart' hide Router;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sickchill/flutter_sickchill.dart';
import 'package:flutter_transmission/flutter_transmission.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/l10n/error_localizations.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/presentation/proxy_scaffold.dart';
import 'package:lisa_flutter/src/common/stores/speech_store.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/common/utils/logging.dart';
import 'package:lisa_flutter/src/config/routes.dart';
import 'package:lisa_flutter/src/drawer/presentation/drawer.dart';
import 'package:lisa_flutter/src/drawer/stores/drawer_store.dart';
import 'package:lisa_flutter/src/favorites/presentation/favorites.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:lisa_flutter/src/preferences/stores/preferences_store.dart';
import 'package:lisa_flutter/src/splash_screen/presentation/splash_screen.dart';
import 'package:provider/provider.dart';

@pragma('vm:entry-point')
void mainWear() {
  app(true);
}

void main() {
  app(false);
}

void app(bool isWear) async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferencesProvider().setup();
  final navigatorKey = GlobalKey<NavigatorState>();
  UserStore userStore;
  BackendApiProvider.setup(navigatorKey, () => userStore);
  initLogger();
  userStore = UserStore();
  runApp(
    TransmissionScope(
      baseUrl: 'http://192.168.1.35:9091/transmission/rpc',
      enableLog: !kIsProductionMode,
      child: SickChillScope(
        enableLogs: !kIsProductionMode,
        baseUrl: 'http://192.168.1.35:8081',
        apiKey: '6678ab0183ce51868e84c4b1738939cc',
        child: MyApp(
          navigatorKey: navigatorKey,
          userStore: userStore,
          router: Router(isWear: isWear),
        ),
      ),
    ),
  );
}

class MyApp extends HookWidget {
  static const _primaryColor = Color(0xff1bbc9b);
  final GlobalKey<NavigatorState> navigatorKey;
  final UserStore userStore;
  final Router router;

  MyApp({this.navigatorKey, this.userStore, this.router});

  @override
  Widget build(BuildContext context) {
    final prefStore = useMemoized(() => PreferencesStore());
    final drawerStore = useMemoized(() => DrawerStore());

    useEffect(() {
      prefStore.init();
      return null;
    }, [prefStore]);

    return MultiProvider(
      providers: [
        Provider.value(value: drawerStore),
        Provider.value(value: userStore),
        Provider.value(value: prefStore),
      ],
      child: Observer(
        builder: (context) {
          var locale;

          if (userStore.lang != null) {
            locale = kSupportedLanguages.firstWhere((locale) => locale.languageCode == userStore.lang, orElse: () => null);
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
                brightness: prefStore.isDarkTheme ? Brightness.dark : Brightness.light,
                primaryColor: _primaryColor,
              ),
              buttonTheme: ButtonThemeData(
                buttonColor: _primaryColor,
                textTheme: ButtonTextTheme.normal,

              ),
              fontFamily: 'Raleway',
              brightness: prefStore.isDarkTheme ? Brightness.dark : Brightness.light,
              primaryColorBrightness: Brightness.dark,
              accentColorBrightness: Brightness.dark,
              primaryColor: _primaryColor,
              primaryColorLight: _primaryColor.withOpacity(0.2),
              primaryColorDark: _primaryColor,
              accentColor: _primaryColor,
              cursorColor: _primaryColor,
              indicatorColor: _primaryColor,
              textSelectionColor: _primaryColor,
              textSelectionHandleColor: _primaryColor,
            ),
            initialRoute: SplashScreen.route,
            navigatorKey: navigatorKey,
            onGenerateRoute: router.onGenerateRoute,
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
    final store = useMemoized(() => SpeechStore());
    final userStore = Provider.of<UserStore>(context);
    return Provider.value(
      value: store,
      child: ProxyScaffold(
        builderDrawer: (context) => AppDrawer(),
        initialRoute: FavoritesWidget.route, //FIXME why it doesn't work?? check routes.dart userStore.lastRoute ?? FavoritesWidget.route,
      ),
    );
  }
}
