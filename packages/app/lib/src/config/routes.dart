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
import 'package:lisa_flutter/src/scenes/presentation/scenes.dart';
import 'package:lisa_flutter/src/splash_screen/presentation/splash_screen.dart';
import 'package:lisa_server_sdk/model/room.dart';

class Router {
  static final Map<String, dynamic> routes = {
    LoginScreen.route: (_) => LoginScreen(),
    SplashScreen.route: (_) => SplashScreen(),
    ProfileScreen.route: (_) => ProfileScreen(),
    AddDeviceScreen.route: (context) {
      return AddDeviceScreen(room: ModalRoute.of(context).settings.arguments);
    },
    ScenesWidget.route: (_) => ScenesWidget(),
    FavoritesWidget.route: (_) => FavoritesWidget(),
    PreferencesWidget.route: (_) => PreferencesWidget(),
    RoomDashboard.route: (context) {
      final Room room = ModalRoute.of(context).settings.arguments;
      return RoomDashboard(room: room);
    },
    OrphansWidget.route: (_) => OrphansWidget(),
    MyHomePage.route: (_) => MyHomePage(),
  };

  Route onGenerateRoute(RouteSettings settings) {
    if (MyHomePage.route == settings.name) {
      return MaterialPageRoute(builder: routes[settings.name], settings: settings);
    }
    return CupertinoPageRoute(builder: routes[settings.name], settings: settings);
  }
}
