import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lisa_flutter/main.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/utils/page_route_builders.dart';
import 'package:lisa_flutter/src/devices/presentation/add_device.dart';
import 'package:lisa_flutter/src/favorites/presentation/favorites.dart';
import 'package:lisa_flutter/src/login/presentation/login_screen.dart';
import 'package:lisa_flutter/src/login/presentation/login_wear_screen.dart';
import 'package:lisa_flutter/src/login/presentation/setup_screen.dart';
import 'package:lisa_flutter/src/multimedia/presentation/multimedia.dart';
import 'package:lisa_flutter/src/orphans/presentation/orphans.dart';
import 'package:lisa_flutter/src/plugins/presentation/plugins.dart';
import 'package:lisa_flutter/src/preferences/presentation/preferences.dart';
import 'package:lisa_flutter/src/profile/presentation/profile.dart';
import 'package:lisa_flutter/src/rooms/presentation/room_dashboard.dart';
import 'package:lisa_flutter/src/scenes/presentation/scene.dart';
import 'package:lisa_flutter/src/scenes/presentation/scenes.dart';
import 'package:lisa_flutter/src/settings/presentation/settings.dart';
import 'package:lisa_flutter/src/splash_screen/presentation/splash_screen.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';

class Router {
  final bool isWear;

  Router({this.isWear = false});

  Map<String, dynamic> get routes => isWear ? _wearRoutes : _routes;

  final Map<String, dynamic> _routes = {
    LoginScreen.route: (_) => LoginScreen(),
    SetupScreen.route: (_) => SetupScreen(),
    SplashScreen.route: (_) => SplashScreen(),
    ProfileScreen.route: (_) => ProfileScreen(),
    AddDeviceScreen.route: (context) => AddDeviceScreen(room: ModalRoute.of(context)!.settings.arguments as Room),
    ScenesWidget.route: (_) => ScenesWidget(),
    SceneWidget.route: (context) => SceneWidget(scene: ModalRoute.of(context)!.settings.arguments as Scene),
    FavoritesWidget.route: (_) => FavoritesWidget(),
    PreferencesWidget.route: (_) => PreferencesWidget(),
    SettingsWidget.route: (_) => SettingsWidget(),
    PluginsStoreWidget.route: (_) => PluginsStoreWidget(),
    RoomDashboard.route: (context) => RoomDashboard(room: ModalRoute.of(context)!.settings.arguments as Room),
    OrphansWidget.route: (_) => OrphansWidget(),
    MultimediaWidget.route: (_) => MultimediaWidget(),
    MyHomePage.route: (_) => MyHomePage(),
  };

  final Map<String, dynamic> _wearRoutes = {
    LoginScreen.route: (_) => LoginWearScreen(),
    SplashScreen.route: (_) => SplashScreen(),
    ProfileScreen.route: (_) => ProfileScreen(),
    AddDeviceScreen.route: (context) => AddDeviceScreen(room: ModalRoute.of(context)!.settings.arguments as Room),
    ScenesWidget.route: (_) => ScenesWidget(),
    SceneWidget.route: (context) => SceneWidget(scene: ModalRoute.of(context)!.settings.arguments as Scene),
    FavoritesWidget.route: (_) => FavoritesWidget(),
    PreferencesWidget.route: (_) => PreferencesWidget(),
    RoomDashboard.route: (context) => RoomDashboard(room: ModalRoute.of(context)!.settings.arguments as Room),
    OrphansWidget.route: (_) => OrphansWidget(),
    MyHomePage.route: (_) => MyHomePage(),
  };

  Route? onGenerateRoute(RouteSettings settings) {
   if (routes[settings.name] == null) {
      return null;
    }

    return _getPageRoute(settings);
  }

  PageRoute _getPageRoute(RouteSettings settings) {
    //FIXME doesn't work as arguments stay null for some reason... to be checked in flutter sources
    if (settings.name != null && settings.name!.contains(RoomDashboard.route + '/')) {
      return MaterialPageRoute(
        builder: routes[RoomDashboard.route],
        settings: settings.copyWith(arguments: (RoomBuilder()..id= int.parse(settings.name!.split('/').last)..name= '').build()),
      );
    }

    if (settings.arguments is FadePageRouteArguments) {
      return FadePageRoute(builder: routes[settings.name], settings: settings.copyWith(arguments: (settings.arguments as FadePageRouteArguments).arguments));
    } else if (isWear) {
      return CupertinoPageRoute(builder: routes[settings.name], settings: settings);
    }
    return MaterialPageRoute(builder: routes[settings.name], settings: settings);
  }

}

class FadePageRouteArguments {
  final dynamic arguments;

  FadePageRouteArguments({this.arguments});
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
      case FavoritesWidget.route:
        return localizations.menuFavorite;
      case ProfileScreen.route:
        return localizations.profile;
      case PreferencesWidget.route:
        return localizations.menuPreferences;
      case SettingsWidget.route:
        return localizations.menuSettings;
      case OrphansWidget.route:
        return localizations.menuOrphans;
      case RoomDashboard.route:
        return (arguments as Room?)?.name ?? 'L.I.S.A.';
      case ScenesWidget.route:
        return localizations.menuScenes;
      case PluginsStoreWidget.route:
        return localizations.pluginShop;
      case MultimediaWidget.route:
        return localizations.menuMultimedia;
      case MultimediaWidget.routeSickChill:
        return localizations.menuMultimediaSickChill;
      case MultimediaWidget.routeTransmission:
        return localizations.menuMultimediaTransmission;
    }
    if (route != null && route.startsWith(MultimediaWidget.routeSickChillShow)) {
      return localizations.menuMultimediaSickChill;
    }
    return 'L.I.S.A.';
  }

  String? getRoute(Route route) {
    if (RoomDashboard.route == route.settings.name) {
      return '${route.settings.name}/${(route.settings.arguments as Room).id}';
    }
    return route.settings.name;
  }
}
