import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/speech_button.dart';
import 'package:lisa_flutter/src/common/utils/platform_detector/platform_detector.dart';
import 'package:lisa_flutter/src/config/routes.dart';
import 'package:lisa_flutter/src/devices/presentation/add_device.dart';
import 'package:lisa_flutter/src/drawer/stores/drawer_store.dart';
import 'package:provider/provider.dart';
import 'package:proxy_layout/proxy_layout.dart';

class _NestedNavigatorAndroidSupport extends StatelessWidget {
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  const _NestedNavigatorAndroidSupport({Key key, this.child, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return child;
    }
    return WillPopScope(child: child, onWillPop: () async => !await navigatorKey.currentState.maybePop());
  }
}

class ProxyScaffold extends HookWidget {
  final WidgetBuilder builderDrawer;
  final String initialRoute;

  const ProxyScaffold({Key key, this.builderDrawer, this.initialRoute}) : super(key: key);

  static bool isMobileView(BuildContext context) {
    return DeviceProxy.isMobile(context) || (DeviceProxy.isTablet(context) && OrientationProxy.isPortrait(context));
  }

  @override
  Widget build(BuildContext context) {
    final localizations = CommonLocalizations.of(context);
    final titleState = useState('L.I.S.A.');
    final currentRoute = useState('/');
    final canPopState = useState(false);

    final onTitleChange = (title, route) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        currentRoute.value = route;
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
              child: _NestedNavigatorAndroidSupport(
                navigatorKey: navigatorKey,
                child: Navigator(
                  initialRoute: initialRoute,
                  observers: observers,
                  onGenerateRoute: Router().onGenerateRoute,
                  key: navigatorKey,
                ),
              ),
            ),
            appBar: _getAppBar(context, currentRoute.value, titleState.value, canPopState.value, navigatorKey, observers),
          );
        },
        tabletBuilder: (context) {
          return OrientationProxy(
            landscapeBuilder: (context) {
              return Scaffold(
                appBar: _getAppBar(context, currentRoute.value, titleState.value, canPopState.value, navigatorKey, observers),
                body: Row(
                  children: <Widget>[
                    if (builderDrawer != null) Expanded(child: builderDrawer(context), flex: 1),
                    if (builderDrawer != null) VerticalDivider(width: 1),
                    Expanded(
                        child: ClipRect(
                          clipBehavior: Clip.hardEdge,
                          child: _NestedNavigatorAndroidSupport(
                            navigatorKey: navigatorKey,
                            child: Navigator(
                              initialRoute: initialRoute,
                              observers: observers,
                              onGenerateRoute: Router().onGenerateRoute,
                              key: navigatorKey,
                            ),
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
                appBar: _getAppBar(context, currentRoute.value, titleState.value, canPopState.value, navigatorKey, observers),
                body: _NestedNavigatorAndroidSupport(
                  navigatorKey: navigatorKey,
                  child: Navigator(
                    initialRoute: initialRoute,
                    observers: observers,
                    onGenerateRoute: Router().onGenerateRoute,
                    key: navigatorKey,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  AppBar _getAppBar(
      BuildContext context, String currentRoute, String title, bool canPop, GlobalKey<NavigatorState> navigatorKey, List<NavigatorObserver> observers) {
    final translations = CommonLocalizations.of(context);
    kDebugLogger.info('Current route: $currentRoute');
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
        if (kIsMobile() && currentRoute != null && currentRoute.contains('/room'))
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
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
        if (defaultTargetPlatform == TargetPlatform.macOS && !kIsWeb &&
            currentRoute != null &&
            (currentRoute == '/' || currentRoute.contains('/room') || currentRoute.contains('/orphans')))
          SpeechButton(isFloating: false, roomId: currentRoute.contains('/room') ? currentRoute.split('/').last : null)
      ],
    );
  }
}
