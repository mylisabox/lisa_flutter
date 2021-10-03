import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sickchill/flutter_sickchill.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_transmission/flutter_transmission.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/loading.dart';
import 'package:lisa_flutter/src/common/presentation/sliver_animated_switcher.dart';
import 'package:lisa_flutter/src/common/presentation/speech_button.dart';
import 'package:lisa_flutter/src/common/presentation/user_dialog.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/common/utils/base_url_provider.dart';
import 'package:lisa_flutter/src/common/utils/extensions.dart';
import 'package:lisa_flutter/src/common/utils/modal_page_route.dart';
import 'package:lisa_flutter/src/devices/presentation/add_device.dart';
import 'package:lisa_flutter/src/devices/presentation/device_screen.dart';
import 'package:lisa_flutter/src/rooms/stores/room_store.dart';
import 'package:lisa_flutter/src/scenes/presentation/scenes.dart';
import 'package:lisa_flutter/src/settings/stores/settings_store.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:mobx/mobx.dart';
import 'package:proxy_layout/proxy_layout.dart';

enum HomeScreenTab { home, media }

class HomeScreen extends HookWidget {
  static const route = 'home';

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mode = useState(HomeScreenTab.home);
    final roomsStore = context.of<RoomStore>();

    useEffect(() {
      roomsStore.loadRooms();
      return null;
    }, const []);

    return Scaffold(
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            _LisaAppBar(mode: mode),
            if (mode.value == HomeScreenTab.home)
              CupertinoSliverRefreshControl(
                onRefresh: () {
                  return roomsStore.reloadRooms();
                },
              ),
            SliverAnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              child: mode.value == HomeScreenTab.home ? _RoomTab() : _MediaTab(),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: _LisaBottomBar(mode: mode),
      floatingActionButtonLocation: const _CenterDockedFabLocation(),
      floatingActionButton: SpeechButton(),
    );
  }
}

const _bottomBarHeight = 56.0;

class _LisaBottomBar extends StatelessWidget {
  const _LisaBottomBar({
    Key? key,
    required this.mode,
  }) : super(key: key);

  final ValueNotifier<HomeScreenTab> mode;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 6,
      shape: CircularNotchedRectangle(),
      child: SizedBox(
        height: _bottomBarHeight, //56 size of floating button
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15)),
                onTap: () {
                  mode.value = HomeScreenTab.home;
                },
                child: Icon(
                  Icons.home_outlined,
                  size: mode.value == HomeScreenTab.home ? 32 : 24,
                  color: mode.value == HomeScreenTab.home ? context.primaryColor : context.brightnessColor,
                ),
              ),
            ),
            SizedBox(width: kToolbarHeight),
            Expanded(
              child: InkWell(
                onTap: () {
                  mode.value = HomeScreenTab.media;
                },
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
                child: Icon(
                  Icons.perm_media_outlined,
                  size: mode.value == HomeScreenTab.media ? 28 : 22,
                  color: mode.value == HomeScreenTab.media ? context.primaryColor : context.brightnessColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LisaAppBar extends StatelessWidget {
  const _LisaAppBar({
    Key? key,
    required this.mode,
  }) : super(key: key);

  final ValueNotifier<HomeScreenTab> mode;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      elevation: 4,
      leading: Visibility(
        visible: mode.value == HomeScreenTab.home,
        child: IconButton(
          onPressed: () {
            context.navigator.pushNamed(AddDeviceScreen.route);
          },
          icon: Icon(Icons.add, color: context.brightnessColor),
          splashRadius: 28,
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Observer(
              builder: (context) {
                final prefStore = context.of<SettingsStore>();
                return SvgPicture.asset(
                  prefStore.isDarkTheme ? 'assets/images/lisa_white.svg' : 'assets/images/lisa_black.svg',
                  height: kToolbarHeight - 12,
                  alignment: Alignment.bottomCenter,
                );
              },
            ),
          ),
        ],
      ),
      floating: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: kSmallPadding),
          child: _Avatar(),
        ),
      ],
    );
  }
}

class _MediaTab extends StatelessWidget {
  const _MediaTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(kNormalPadding),
      sliver: SliverGrid(
        delegate: SliverChildListDelegate(
          [
            _MediaItem(
              label: 'Kodi',
              image: 'assets/images/kodi.svg',
              onTap: () {
                showAppDialog(context, (_) => Text('title'), (_) => Text('content'), actions: [
                  DialogAction(callback: (context) {}, text: 'Ok'),
                ]);
              },
            ),
            _MediaItem(
              label: 'Transmission',
              image: 'assets/images/transmission.png',
              onTap: () {
                const routeTransmission = '/multimedia/transmission';
                final isMobile = DeviceProxy.isMobile(context);
                final color = HSLColor.fromColor(Theme.of(context).primaryColor).withLightness(0.3);
                Navigator.of(context, rootNavigator: isMobile).push(MaterialPageRoute(
                    builder: (context) => IconTheme(
                          data: IconThemeData(color: Colors.white),
                          child: TransmissionScreen(
                            headless: !isMobile,
                            iconActiveColor: color.toColor(),
                          ),
                        ),
                    settings: RouteSettings(name: routeTransmission)));
              },
            ),
            _MediaItem(
              label: 'SickChill',
              image: 'assets/images/sickchill.png',
              onTap: () {
                const routeSickChill = '/multimedia/sickchill';

                final isMobile = DeviceProxy.isMobile(context);
                Navigator.of(context, rootNavigator: isMobile)
                    .push(MaterialPageRoute(builder: (context) => SickChillScreen(headless: !isMobile), settings: RouteSettings(name: routeSickChill)));
              },
            ),
          ],
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: kNormalPadding, mainAxisSpacing: kNormalPadding),
      ),
    );
  }
}

class _MediaItem extends StatelessWidget {
  final String label;
  final String image;
  final VoidCallback onTap;

  const _MediaItem({Key? key, required this.label, required this.image, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image.endsWith('.svg'))
              SizedBox(
                width: 90,
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.all(kSmallPadding),
                  child: SvgPicture.asset(image),
                ),
              ),
            if (image.endsWith('.png')) Image.asset(image, width: 90, height: 90),
            Text(label, style: context.textTheme.subtitle1),
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback onTap;

  const _QuickAction({Key? key, required this.onTap, required this.icon, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      radius: 45,
      onTap: onTap,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(kNormalPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: kSmallPadding),
                child: Container(
                  padding: const EdgeInsets.all(kNormalPadding),
                  child: icon,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                ),
              ),
              Text(label, style: context.textTheme.caption),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.of<RoomStore>();
    return Column(
      children: [
        Observer(
            builder: (context) => Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    if (store.hasLights)
                      _QuickAction(
                        onTap: () {
                          context.navigator.pushNamed(ScenesScreen.route);
                        },
                        icon: SvgPicture.asset('assets/images/widgets/bulb_on.svg', width: 20),
                        label: 'Lights',
                      ),
                    if (store.hasShutters)
                      _QuickAction(
                        onTap: () {
                          context.navigator.pushNamed(ScenesScreen.route);
                        },
                        icon: SvgPicture.asset('assets/images/widgets/shutter_off.svg', width: 20),
                        label: 'Shutters',
                      ),
                    if (store.hasWebcams)
                      _QuickAction(
                        onTap: () {
                          context.navigator.pushNamed(ScenesScreen.route);
                        },
                        icon: SvgPicture.asset('assets/images/widgets/webcam.svg', width: 20),
                        label: 'Webcams',
                      ),
                  ],
                )),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            _QuickAction(
              onTap: () {
                context.navigator.pushNamed(ScenesScreen.route);
              },
              icon: Icon(Icons.filter_frames, size: 20),
              label: context.localizations.menuScenes,
            ),
            _QuickAction(
              onTap: () {},
              icon: Icon(Icons.settings_outlined, size: 20),
              label: context.localizations.menuSettings,
            ),
          ],
        ),
      ],
    );
  }
}

class _RoomTab extends StatelessWidget {
  const _RoomTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roomsStore = context.of<RoomStore>();
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: _bottomBarHeight),
      sliver: Observer(
        builder: (context) {
          if (roomsStore.roomsStatus.status == FutureStatus.pending) {
            return const SliverToBoxAdapter(
              child: Loading(),
            );
          } else if (roomsStore.roomsStatus.status == FutureStatus.rejected) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(kNormalPadding),
                child: Center(
                  child: Text(
                    handleError(roomsStore.roomsStatus.error, null).cause.twoLiner(context),
                  ),
                ),
              ),
            );
          }
          return SliverReorderableList(
            itemBuilder: (context, index) {
              if (index == 0) {
                return const _QuickActions(key: ValueKey('quickActions'));
              }
              final room = roomsStore.rooms[index - 1];
              return _RoomItem(
                key: ValueKey('${room.id}'),
                room: room,
                index: index,
              );
            },
            itemCount: roomsStore.rooms.length + 1,
            onReorder: (int oldIndex, int newIndex) {},
          );
        },
      ),
    );
  }
}

class _RoomItem extends StatelessWidget {
  final Room room;
  final bool editMode;
  final int index;

  const _RoomItem({Key? key, required this.room, required this.index, this.editMode = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kNormalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: kNormalPadding),
            child: Row(
              children: [
                Expanded(child: const Divider(height: 1)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kNormalPadding),
                  child: Text(room.name, style: context.textTheme.subtitle1),
                ),
                Expanded(child: const Divider(height: 1)),
                if (editMode)
                  ReorderableDragStartListener(
                    child: Icon(Icons.reorder_outlined),
                    index: index,
                  ),
              ],
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            primary: false,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: room.devices.map((device) {
              return _DeviceItem(device: device);
            }).toList(growable: false),
          ),
        ],
      ),
    );
  }
}

class _DeviceItem extends StatelessWidget with BaseUrlProvider {
  final Device device;

  const _DeviceItem({Key? key, required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final img = device.powered ? device.imageOn : device.imageOff;

    final imgWidget = img!.startsWith('assets/')
        ? SvgPicture.asset(
            img,
            key: ValueKey(img),
            fit: BoxFit.contain,
          )
        : SvgPicture.network(
            getPluginImageUrl(device.pluginName, img),
            key: ValueKey(img),
            fit: BoxFit.contain,
          );

    return InkWell(
      onTap: () {
        context.navigator.pushNamed(DeviceScreen.route, arguments: device);
      },
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: 130,
              height: 90,
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    child: imgWidget,
                  ),
                  if ((device.groupCount ?? 0) > 0)
                    Align(
                        alignment: Alignment.topRight,
                        child: Chip(
                          label: Text(device.groupCount!.toString()),
                        )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kNormalPadding),
            child: Text(device.name, style: context.textTheme.caption),
          ),
          TextButton(
            child: Text(device.defaultAction ?? ''),
            onPressed: device.defaultAction == null
                ? null
                : () {
                    context.of<RoomStore>(listen: false).triggerDevice(device);
                  },
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userStore = context.of<UserStore>();
    return Hero(
      tag: 'userAvatar',
      child: Observer(
        builder: (context) => CircleAvatar(
          radius: 20,
          backgroundColor: context.primaryColor,
          backgroundImage: userStore.avatar == null ? null : NetworkImage(userStore.avatar!),
          child: Stack(
            children: [
              if (userStore.avatar == null)
                Center(
                  child: Icon(
                    Icons.person,
                    color: context.brightnessColor,
                  ),
                ),
              Material(
                type: MaterialType.circle,
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    context.navigator.push(
                      ModalPageRoute(
                        builder: (context) => UserDialog(),
                        settings: RouteSettings(name: '/userDialog'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CenterDockedFabLocation extends StandardFabLocation with FabCenterOffsetX {
  const _CenterDockedFabLocation();

  @override
  String toString() => '_CenterDockedFabLocation.centerDocked';

  /// Calculates y-offset for [FloatingActionButtonLocation]s floating over the
  /// [Scaffold.bottomNavigationBar] so that the center of the floating
  /// action button lines up with the top of the bottom navigation bar.
  /// Copies from FabDockedOffsetY
  @override
  double getOffsetY(ScaffoldPrelayoutGeometry scaffoldGeometry, double adjustment) {
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double contentMargin = scaffoldGeometry.scaffoldSize.height - contentBottom;
    final double bottomViewPadding = scaffoldGeometry.minViewPadding.bottom;
    final double bottomSheetHeight = scaffoldGeometry.bottomSheetSize.height + 15; // add 10 to move a bit up the floating button
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;
    final double bottomMinInset = scaffoldGeometry.minInsets.bottom;

    double safeMargin;

    if (contentMargin > bottomMinInset + fabHeight / 2.0) {
      // If contentMargin is higher than bottomMinInset enough to display the
      // FAB without clipping, don't provide a margin
      safeMargin = 0.0;
    } else if (bottomMinInset == 0.0) {
      // If bottomMinInset is zero(the software keyboard is not on the screen)
      // provide bottomViewPadding as margin
      safeMargin = bottomViewPadding;
    } else {
      // Provide a margin that would shift the FAB enough so that it stays away
      // from the keyboard
      safeMargin = fabHeight / 2.0 + kFloatingActionButtonMargin;
    }

    double fabY = contentBottom - fabHeight / 2.0 - safeMargin;
    // The FAB should sit with a margin between it and the snack bar.
    if (snackBarHeight > 0.0) fabY = math.min(fabY, contentBottom - snackBarHeight - fabHeight - kFloatingActionButtonMargin);
    // The FAB should sit with its center in front of the top of the bottom sheet.
    if (bottomSheetHeight > 0.0) fabY = math.min(fabY, contentBottom - bottomSheetHeight - fabHeight / 2.0);
    final double maxFabY = scaffoldGeometry.scaffoldSize.height - fabHeight - safeMargin;
    return math.min(maxFabY, fabY);
  }
}
