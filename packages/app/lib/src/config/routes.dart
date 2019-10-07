import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lisa_flutter/main.dart';
import 'package:lisa_flutter/src/devices/presentation/add_device.dart';
import 'package:lisa_flutter/src/favorites/presentation/favorites.dart';
import 'package:lisa_flutter/src/login/presentation/login_screen.dart';
import 'package:lisa_flutter/src/orphans/presentation/orphans.dart';
import 'package:lisa_flutter/src/preferences/presentation/preferences.dart';
import 'package:lisa_flutter/src/profile/presentation/profile.dart';
import 'package:lisa_flutter/src/rooms/presentation/room_dashboard.dart';
import 'package:lisa_flutter/src/scenes/presentation/scene.dart';
import 'package:lisa_flutter/src/scenes/presentation/scenes.dart';
import 'package:lisa_flutter/src/splash_screen/presentation/splash_screen.dart';
import 'package:lisa_server_sdk/model/room.dart';

class Router extends NavigatorObserver implements Listenable {
  static Router _instance;
  //final OnCanPopChange onCanPopChange;
  final List<String> _history = [];
  dynamic arguments;


  final Map<String, dynamic> routes = {
    LoginScreen.route: (_) => LoginScreen(),
    SplashScreen.route: (_) => SplashScreen(),
    ProfileScreen.route: (_) => ProfileScreen(),
    AddDeviceScreen.route: (context) => AddDeviceScreen(room: ModalRoute.of(context).settings.arguments),
    ScenesWidget.route: (_) => ScenesWidget(),
    SceneWidget.route: (context) => SceneWidget(scene: ModalRoute.of(context).settings.arguments),
    FavoritesWidget.route: (_) => FavoritesWidget(),
    PreferencesWidget.route: (_) => PreferencesWidget(),
    RoomDashboard.route: (context) => RoomDashboard(room: ModalRoute.of(context).settings.arguments),
    OrphansWidget.route: (_) => OrphansWidget(),
    MyHomePage.route: (_) => MyHomePage(),
  };

  factory Router() {
    return _instance ?? Router._create();
  }

  Router._create();

  Route onGenerateRoute(RouteSettings settings) {
    //FIXME doesn't work as arguments stay null for some reason... to be checked in flutter sources
    if (settings.name.contains(RoomDashboard.route + '/')) {
      return MaterialPageRoute(
        builder: routes[RoomDashboard.route],
        settings: settings.copyWith(arguments: Room(id: int.parse(settings.name.split('/').last), name: '')),
      );
    }

    if (routes[settings.name] == null) {
      return null;
    }

    if (MyHomePage.route == settings.name) {
      return MaterialPageRoute(builder: routes[settings.name], settings: settings.copyWith(isInitialRoute: true));
    }
    return MaterialPageRoute(builder: routes[settings.name], settings: settings);
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    arguments = route.settings.arguments;
    _history.removeLast();
    //onCanPopChange(_history.length > 1);
    notify();
  }

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    arguments = route.settings.arguments;
    //onCanPopChange(_history.isNotEmpty);
    _history.add(route.settings.name);
    notify();
  }

  final List<VoidCallback> _listeners = [];

  @override
  void addListener(listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(listener) {
    _listeners.remove(listener);
  }

  void notify() {
    for(var listener in _listeners) {
      listener();
    }
  }
}
