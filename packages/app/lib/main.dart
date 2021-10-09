import 'package:collection/collection.dart';
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
import 'package:lisa_flutter/src/common/stores/speech_store.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/common/utils/hooks.dart';
import 'package:lisa_flutter/src/common/utils/logging.dart';
import 'package:lisa_flutter/src/common/utils/page_route_builders.dart';
import 'package:lisa_flutter/src/config/routes.dart';
import 'package:lisa_flutter/src/login/presentation/login_screen.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:lisa_flutter/src/rooms/stores/room_store.dart';
import 'package:lisa_flutter/src/settings/stores/settings_store.dart';
import 'package:lisa_flutter/src/splash_screen/presentation/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@pragma('vm:entry-point')
void mainWear() {
  app(true);
}

void main() {
  app(false);
}

void app(bool isWear) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SentryFlutter.init(
    (SentryFlutterOptions options) {
      options.dsn = kIsProductionMode ? 'https://53c5686c50434e9884c1a763b984af58@sentry.io/1777712' : '';
    },
    appRunner: () async {
      await PreferencesProvider().setup();
      final navigatorKey = GlobalKey<NavigatorState>();
      late UserStore userStore;
      BackendApiProvider.setup(navigatorKey, () => userStore, PreferencesProvider(), baseUrl: 'http://localhost');
      initLogger();
      userStore = UserStore();
      if (kIsWeb) {
        await userStore.init().catchError((_) {});
      }
      runApp(
        Observer(
          builder: (context) => TransmissionScope(
            key: ValueKey('proxy_transmission_${userStore.proxyUrl}'),
            proxyUrl: userStore.proxyUrl + 'token=${userStore.currentToken}&url=',
            baseUrl: 'http://192.168.1.35:9091/transmission/rpc',
            enableLog: !kIsProductionMode,
            child: SickChillScope(
              key: ValueKey('proxy_sickchill_${userStore.proxyUrl}'),
              enableLogs: !kIsProductionMode,
              baseUrl: 'http://192.168.1.35:8081',
              proxyUrl: userStore.proxyUrl + 'token=${userStore.currentToken}&url=',
              apiKey: '6678ab0183ce51868e84c4b1738939cc',
              child: MyApp(
                navigatorKey: navigatorKey,
                userStore: userStore,
                router: Router(isWear: isWear),
              ),
            ),
          ),
        ),
      );
    },
  );
}

MaterialColor createMaterialColor(Color color) {
  final strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class MyApp extends HookWidget {
  static const _primaryColor = Color(0xff1bbc9b);
  final GlobalKey<NavigatorState> navigatorKey;
  final UserStore userStore;
  final Router router;

  const MyApp({required this.navigatorKey, required this.userStore, required this.router, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefStore = useMemoized(() => SettingsStore());
    final speechStore = useMemoized(() => SpeechStore());
    final roomStore = useMemoized(() => RoomStore());
    useAppLifeCycleObserver(() {
      userStore.logout();
      navigatorKey.currentState?.pushAndRemoveUntil(
          FromBottomPageRoute(
            builder: (_) => const LoginScreen(),
            settings: const RouteSettings(name: LoginScreen.route),
          ),
          (route) => true);
    });

    useEffect(() {
      prefStore.init();
      return null;
    }, [prefStore]);

    return MultiProvider(
      providers: [
        Provider.value(value: userStore),
        Provider.value(value: prefStore),
        Provider.value(value: speechStore),
        Provider.value(value: roomStore),
      ],
      child: Observer(
        builder: (context) {
          Locale? locale;

          if (userStore.lang != null) {
            locale = kSupportedLanguages.firstWhereOrNull((locale) => locale.languageCode == userStore.lang);
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
              dialogTheme: DialogTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kNormalPadding),
                ),
              ),
              primarySwatch: createMaterialColor(_primaryColor),
              cupertinoOverrideTheme: CupertinoThemeData(
                brightness: prefStore.isDarkTheme ? Brightness.dark : Brightness.light,
                primaryColor: _primaryColor,
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(foregroundColor: Colors.white),
              buttonTheme: const ButtonThemeData(
                buttonColor: _primaryColor,
                textTheme: ButtonTextTheme.normal,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(_primaryColor))),
              fontFamily: 'Raleway',
              brightness: prefStore.isDarkTheme ? Brightness.dark : Brightness.light,
              primaryColorBrightness: Brightness.dark,
              primaryColor: _primaryColor,
              primaryColorLight: _primaryColor.withOpacity(0.2),
              primaryColorDark: _primaryColor,
              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: _primaryColor,
                selectionColor: _primaryColor,
                selectionHandleColor: _primaryColor,
              ),
              iconTheme: const IconThemeData(color: _primaryColor),
              indicatorColor: _primaryColor,
            ),
            initialRoute: SplashScreen.route,
            navigatorKey: navigatorKey,
            navigatorObservers: [
              SentryNavigatorObserver(),
            ],
            onGenerateRoute: router.onGenerateRoute,
          );
        },
      ),
    );
  }
}
