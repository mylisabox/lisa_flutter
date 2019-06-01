import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/config/routes.dart';
import 'package:lisa_flutter/src/favorites/presentation/favorites.dart';
import 'package:lisa_flutter/src/orphans/presentation/orphans.dart';
import 'package:lisa_flutter/src/preferences/presentation/preferences.dart';
import 'package:lisa_flutter/src/profile/presentation/profile.dart';
import 'package:lisa_flutter/src/rooms/presentation/room_dashboard.dart';
import 'package:lisa_server_sdk/model/room.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:proxy_layout/proxy_layout.dart';

typedef OnTitleChange = void Function(String title, String route);

class ProxyScaffold extends HookWidget {
  final WidgetBuilder builderDrawer;
  final String initialRoute;
  final Widget floatingActionButton;
  final PreferredSizeWidget appBar;
  final OnTitleChange onTitleChange;

  const ProxyScaffold({Key key, this.onTitleChange, this.builderDrawer, this.initialRoute, this.floatingActionButton, this.appBar}) : super(key: key);

  static bool isMobileView(BuildContext context) {
    return DeviceProxy.isMobile(context) || (DeviceProxy.isTablet(context) && OrientationProxy.isPortrait(context));
  }

  @override
  Widget build(BuildContext context) {
    final navigatorKey = useMemoized(() => GlobalKey<NavigatorState>());
    final localizations = CommonLocalizations.of(context);
    return Provider(
      builder: (context) => navigatorKey,
      child: DeviceProxy(
        mobileBuilder: (context) {
          return Scaffold(
            drawer: builderDrawer == null ? null : Drawer(child: builderDrawer(context)),
            body: ClipRect(
              clipBehavior: Clip.hardEdge,
              child: Navigator(
                initialRoute: initialRoute,
                observers: [TitleNavigatorObserver(onTitleChange, localizations)],
                onGenerateRoute: Router().onGenerateRoute,
                key: navigatorKey,
              ),
            ),
            appBar: appBar,
            floatingActionButton: floatingActionButton,
          );
        },
        tabletBuilder: (context) {
          return OrientationProxy(
            landscapeBuilder: (context) {
              return Scaffold(
                appBar: appBar,
                floatingActionButton: floatingActionButton,
                body: Row(
                  children: <Widget>[
                    if (builderDrawer != null) Expanded(child: builderDrawer(context), flex: 1),
                    if (builderDrawer != null) VerticalDivider(width: 1),
                    Expanded(
                        child: ClipRect(
                          clipBehavior: Clip.hardEdge,
                          child: Navigator(
                            initialRoute: initialRoute,
                            observers: [TitleNavigatorObserver(onTitleChange, localizations)],
                            onGenerateRoute: Router().onGenerateRoute,
                            key: navigatorKey,
                          ),
                        ),
                        flex: 3),
                  ],
                ),
              );
            },
            portraitBuilder: (context) {
              return Scaffold(
                drawer: builderDrawer == null ? null : Drawer(child: builderDrawer(context)),
                appBar: appBar,
                floatingActionButton: floatingActionButton,
                body: Navigator(
                  initialRoute: initialRoute,
                  observers: [TitleNavigatorObserver(onTitleChange, localizations)],
                  onGenerateRoute: Router().onGenerateRoute,
                  key: navigatorKey,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TitleNavigatorObserver extends NavigatorObserver {
  final _log = Logger('TitleNavigatorObserver');
  final OnTitleChange onTitleChange;
  final CommonLocalizations localizations;

  TitleNavigatorObserver(this.onTitleChange, this.localizations);

  @override
  void didPop(Route route, Route previousRoute) {
    _log.info('didPop ${route.settings.name}');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onTitleChange(getTitle(previousRoute.settings.name, arguments: previousRoute.settings.arguments), getRoute(previousRoute));
    });
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route previousRoute) {
    _log.info('didPush ${route.settings.name}');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onTitleChange(getTitle(route.settings.name, arguments: route.settings.arguments), getRoute(route));
    });
    super.didPush(route, previousRoute);
  }

  String getTitle(String route, {arguments}) {
    switch (route) {
      case FavoritesWidget.route:
        return localizations.menuFavorite;
      case ProfileWidget.route:
        return localizations.profile;
      case PreferencesWidget.route:
        return localizations.menuPreferences;
      case OrphansWidget.route:
        return localizations.menuOrphans;
      case RoomDashboard.route:
        return (arguments as Room).name;
    }
    return 'L.I.S.A.';
  }

  String getRoute(Route route) {
    if (RoomDashboard.route == route.settings.name) {
      return '${route.settings.name}/${(route.settings.arguments as Room).id}';
    }
    return route.settings.name;
  }
}
