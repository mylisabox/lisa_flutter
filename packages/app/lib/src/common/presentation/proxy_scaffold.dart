import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/utils/platform_detector/platform_detector.dart';
import 'package:lisa_flutter/src/config/routes.dart';
import 'package:lisa_flutter/src/devices/presentation/add_device.dart';
import 'package:lisa_flutter/src/drawer/stores/drawer_store.dart';
import 'package:lisa_flutter/src/favorites/presentation/favorites.dart';
import 'package:lisa_flutter/src/orphans/presentation/orphans.dart';
import 'package:lisa_flutter/src/preferences/presentation/preferences.dart';
import 'package:lisa_flutter/src/profile/presentation/profile.dart';
import 'package:lisa_flutter/src/rooms/presentation/room_dashboard.dart';
import 'package:lisa_flutter/src/scenes/presentation/scenes.dart';
import 'package:lisa_server_sdk/model/room.dart';
import 'package:provider/provider.dart';
import 'package:proxy_layout/proxy_layout.dart';

typedef OnTitleChange = void Function(String title, String route);
typedef OnCanPopChange = void Function(bool canPop);

class ProxyScaffold extends HookWidget {
  final WidgetBuilder builderDrawer;
  final String initialRoute;
  final Widget floatingActionButton;

  const ProxyScaffold({Key key, this.builderDrawer, this.initialRoute, this.floatingActionButton}) : super(key: key);

  static bool isMobileView(BuildContext context) {
    return DeviceProxy.isMobile(context) || (DeviceProxy.isTablet(context) && OrientationProxy.isPortrait(context));
  }

  @override
  Widget build(BuildContext context) {
    final localizations = CommonLocalizations.of(context);
    final titleState = useState('L.I.S.A.');
    final canPopState = useState(false);

    final onTitleChange = (title, route) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        titleState.value = title;
      });
      Provider.of<DrawerStore>(context, listen: false).selectRoute(route);
    };
    final onCanPopChange = (canPop) {
      canPopState.value = canPop;
    };

    final navigatorKey = useMemoized(() => GlobalKey<NavigatorState>());
    final observers = useMemoized(() => [TitleNavigatorObserver(onTitleChange, localizations), HistoryNavigatorObserver(onCanPopChange)]);

    return Provider.value(
      value: navigatorKey,
      child: DeviceProxy(
        mobileBuilder: (context) {
          return Scaffold(
            drawer: builderDrawer == null ? null : Drawer(child: builderDrawer(context)),
            body: ClipRect(
              clipBehavior: Clip.hardEdge,
              child: Navigator(
                initialRoute: initialRoute,
                observers: observers,
                onGenerateRoute: Router().onGenerateRoute,
                key: navigatorKey,
              ),
            ),
            appBar: _getAppBar(context, titleState.value, canPopState.value, navigatorKey, observers),
            floatingActionButton: floatingActionButton,
          );
        },
        tabletBuilder: (context) {
          return OrientationProxy(
            landscapeBuilder: (context) {
              return Scaffold(
                appBar: _getAppBar(context, titleState.value, canPopState.value, navigatorKey, observers),
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
                            observers: observers,
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
                appBar: _getAppBar(context, titleState.value, canPopState.value, navigatorKey, observers),
                floatingActionButton: floatingActionButton,
                body: Navigator(
                  initialRoute: initialRoute,
                  observers: observers,
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

  AppBar _getAppBar(BuildContext context, String title, bool canPop, GlobalKey<NavigatorState> navigatorKey, List<NavigatorObserver> observers) {
    final translations = CommonLocalizations.of(context);
    return AppBar(
      leading: canPop && !isMobileView(context)
          ? IconButton(
              icon: const BackButtonIcon(),
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              onPressed: () {
                navigatorKey.currentState.pop();
              },
            )
          : null,
      title: Text(title),
      actions: <Widget>[
        if (kIsMobile())
          IconButton(
            icon: Icon(
              Icons.add,
              semanticLabel: translations.addDevice,
            ),
            tooltip: translations.addDevice,
            onPressed: () {
              if (DeviceProxy.isTablet(context)) {
                showPlatformDialog(context, (_) => AddDeviceDialog(room: ModalRoute.of(context).settings.arguments));
              } else {
                final args = (observers.firstWhere((item) => item is HistoryNavigatorObserver) as HistoryNavigatorObserver).arguments;
                Navigator.of(context, rootNavigator: true).pushNamed(AddDeviceScreen.route, arguments: args);
              }
            },
          ),
      ],
    );
  }
}

class HistoryNavigatorObserver extends NavigatorObserver {
  final OnCanPopChange onCanPopChange;
  final List<String> _history = [];
  dynamic arguments;

  HistoryNavigatorObserver(this.onCanPopChange);

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    arguments = route.settings.arguments;
    _history.removeLast();
    onCanPopChange(_history.length > 1);
  }

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    arguments = route.settings.arguments;
    onCanPopChange(_history.isNotEmpty);
    _history.add(route.settings.name);
  }
}

class TitleNavigatorObserver extends NavigatorObserver {
  final OnTitleChange onTitleChange;
  final CommonLocalizations localizations;

  TitleNavigatorObserver(this.onTitleChange, this.localizations);

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    onTitleChange(getTitle(previousRoute.settings.name, arguments: previousRoute.settings.arguments), getRoute(previousRoute));
  }

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    onTitleChange(getTitle(route.settings.name, arguments: route.settings.arguments), getRoute(route));
  }

  String getTitle(String route, {arguments}) {
    switch (route) {
      case FavoritesWidget.route:
        return localizations.menuFavorite;
      case ProfileScreen.route:
        return localizations.profile;
      case PreferencesWidget.route:
        return localizations.menuPreferences;
      case OrphansWidget.route:
        return localizations.menuOrphans;
      case RoomDashboard.route:
        return (arguments as Room)?.name ?? 'L.I.S.A.';
      case ScenesWidget.route:
        return localizations.menuScenes;
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
