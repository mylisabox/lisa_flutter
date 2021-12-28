import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/utils/page_route_builders.dart';
import 'package:lisa_flutter/src/devices/presentation/add_device.dart';
import 'package:lisa_flutter/src/devices/presentation/device_screen.dart';
import 'package:lisa_flutter/src/home/presentation/home_screen.dart';
import 'package:lisa_flutter/src/login/presentation/login_screen.dart';
import 'package:lisa_flutter/src/login/presentation/login_wear_screen.dart';
import 'package:lisa_flutter/src/login/presentation/setup_screen.dart';
import 'package:lisa_flutter/src/plugins/presentation/plugins.dart';
import 'package:lisa_flutter/src/preferences/presentation/preferences.dart';
import 'package:lisa_flutter/src/profile/presentation/profile.dart';
import 'package:lisa_flutter/src/rooms/presentation/rooms_settings.dart';
import 'package:lisa_flutter/src/scenes/presentation/scene.dart';
import 'package:lisa_flutter/src/scenes/presentation/scenes.dart';
import 'package:lisa_flutter/src/settings/presentation/settings.dart';
import 'package:lisa_flutter/src/splash_screen/presentation/splash_screen.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:proxy_layout/proxy_layout.dart';

class Router {
  final bool isWear;

  Router({this.isWear = false});

  Map<String, dynamic> get routes => isWear ? _wearRoutes : _routes;

  final Map<String, dynamic> _routes = {
    LoginScreen.route: (_) => const LoginScreen(),
    DeviceScreen.route: (context) => DeviceScreen(device: ModalRoute.of(context)!.settings.arguments as Device),
    HomeSettingsScreen.route: (_) => const HomeSettingsScreen(),
    RoomsSettingsScreen.route: (_) => const RoomsSettingsScreen(),
    SetupScreen.route: (_) => const SetupScreen(),
    SplashScreen.route: (_) => const SplashScreen(),
    ProfileScreen.route: (_) => const ProfileScreen(),
    AddDeviceScreen.route: (context) => AddDeviceScreen(room: ModalRoute.of(context)!.settings.arguments as Room?),
    ScenesScreen.route: (_) => const ScenesScreen(),
    SceneWidget.route: (context) => SceneWidget(scene: ModalRoute.of(context)!.settings.arguments as Scene),
    PreferencesWidget.route: (_) => const PreferencesWidget(),
    SettingsScreen.route: (_) => const SettingsScreen(),
    PluginsStoreScreen.route: (_) => const PluginsStoreScreen(),
    HomeScreen.route: (_) => DeviceProxy(tabletBuilder: (context) => const HomeScreenDesktop(), mobileBuilder: (context) => const HomeScreen()),
  };

  final Map<String, dynamic> _wearRoutes = {
    LoginScreen.route: (_) => const LoginWearScreen(),
    SplashScreen.route: (_) => const SplashScreen(),
    ProfileScreen.route: (_) => const ProfileScreen(),
    AddDeviceScreen.route: (context) => AddDeviceScreen(room: ModalRoute.of(context)!.settings.arguments as Room),
    ScenesScreen.route: (_) => const ScenesScreen(),
    SceneWidget.route: (context) => SceneWidget(scene: ModalRoute.of(context)!.settings.arguments as Scene),
    PreferencesWidget.route: (_) => const PreferencesWidget(),
    HomeScreen.route: (_) => const HomeScreen(),
  };

  Route? onGenerateRoute(RouteSettings settings) {
    if (routes[settings.name] == null) {
      return null;
    }

    return _getPageRoute(settings);
  }

  PageRoute _getPageRoute(RouteSettings settings) {
    if (settings.arguments is RouteArguments && (settings.arguments as RouteArguments?)?.type == RouteTransitionType.fade) {
      return FadePageRoute(builder: routes[settings.name], settings: settings.copyWith(arguments: (settings.arguments as RouteArguments).arguments));
    } else if (settings.arguments is RouteArguments && (settings.arguments as RouteArguments?)?.type == RouteTransitionType.fromBottom) {
      return FromBottomPageRoute(builder: routes[settings.name], settings: settings.copyWith(arguments: (settings.arguments as RouteArguments).arguments));
    } else if (isWear) {
      return CupertinoPageRoute(builder: routes[settings.name], settings: settings);
    }
    return MaterialPageRoute(builder: routes[settings.name], settings: settings);
  }
}

enum RouteTransitionType { fromBottom, fade }

class RouteArguments {
  final dynamic arguments;
  final RouteTransitionType type;

  RouteArguments({this.arguments, this.type = RouteTransitionType.fade});
}

typedef OnTitleChange = void Function(String title, String? route);
typedef OnCanPopChange = void Function(bool canPop);

class HistoryNavigatorObserver extends NavigatorObserver {
  final OnCanPopChange onCanPopChange;
  final List<String?> _history = [];
  dynamic arguments;

  String? get currentRoute => _history.isEmpty ? null : _history.last;

  HistoryNavigatorObserver(this.onCanPopChange);

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    arguments = route.settings.arguments;
    _history.removeLast();
    onCanPopChange(_history.length > 1);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    arguments = route.settings.arguments;
    _history.add(route.settings.name);
    onCanPopChange(_history.isNotEmpty);
  }
}

class TitleNavigatorObserver extends NavigatorObserver {
  final OnTitleChange onTitleChange;
  final CommonLocalizations localizations;

  TitleNavigatorObserver(this.onTitleChange, this.localizations);

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null) {
      onTitleChange(getTitle(previousRoute.settings.name, arguments: previousRoute.settings.arguments), getRoute(previousRoute));
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    onTitleChange(getTitle(route.settings.name, arguments: route.settings.arguments), getRoute(route));
  }

  String getTitle(String? route, {Object? arguments}) {
    switch (route) {
      case ProfileScreen.route:
        return localizations.profile;
      case PreferencesWidget.route:
        return localizations.menuPreferences;
      case SettingsWidget.route:
        return localizations.menuSettings;
      case ScenesScreen.route:
        return localizations.menuScenes;
      case PluginsStoreScreen.route:
        return localizations.pluginShop;
    }

    return 'L.I.S.A.';
  }

  String? getRoute(Route route) {
    return route.settings.name;
  }
}
