import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/utils/platform_detector/platform_detector.dart';
import 'package:lisa_flutter/src/config/routes.dart';
import 'package:lisa_flutter/src/devices/presentation/add_device.dart';
import 'package:lisa_flutter/src/drawer/stores/drawer_store.dart';
import 'package:provider/provider.dart';
import 'package:proxy_layout/proxy_layout.dart';

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
      leading: canPop && !isMobileView(context) && navigatorKey.currentState.canPop()
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
        if (kIsMobile() && (observers.firstWhere((item) => item is HistoryNavigatorObserver) as HistoryNavigatorObserver).currentRoute.contains('/room'))
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
