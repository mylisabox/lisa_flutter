import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/proxy_scaffold.dart';
import 'package:lisa_flutter/src/drawer/presentation/drawer.dart';
import 'package:lisa_flutter/src/drawer/stores/drawer_store.dart';
import 'package:lisa_flutter/src/rooms/presentation/room_dashboard.dart';
import 'package:lisa_server_sdk/model/room.dart';
import 'package:provider/provider.dart';

class RoomList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final drawerStore = Provider.of<DrawerStore>(context);
    final rotationController = useAnimationController(duration: Duration(milliseconds: 200), initialValue: drawerStore.isRoomListOpened ? 1 : 0);

    useEffect(() {
      drawerStore.loadRooms();
      return null;
    }, [drawerStore]);

    return Observer(
      builder: (context) {
        return Column(
          children: <Widget>[
            Material(
              elevation: drawerStore.isRoomListOpened ? 2 : 0,
              child: DrawerEntry(
                text: translations.menuRooms,
                icon: Icons.home,
                trailing: RotationTransition(
                  child: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).primaryColor),
                  turns: Tween(begin: .0, end: .25).animate(rotationController),
                ),
                onTap: () {
                  drawerStore.toggleListOpened();
                  if (drawerStore.isRoomListOpened) {
                    rotationController.forward();
                  } else {
                    rotationController.reverse();
                  }
                },
              ),
            ),
            Visibility(
              visible: drawerStore.isRoomListOpened,
              child: Divider(
                height: 1,
              ),
            ),
            AnimatedContainer(
              alignment: Alignment.topCenter,
              duration: Duration(milliseconds: min(drawerStore.roomNumber * 200, 400)),
              height: drawerStore.isRoomListOpened ? drawerStore.roomNumber * DrawerEntry.height + 1 : .0,
              child: ClipRect(
                child: OverflowBox(
                  maxHeight: drawerStore.roomNumber * _RoomIdle.height + 2,
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var room in drawerStore.rooms) ...[_RoomListEntry(room: room)],
                      Padding(
                        padding: const EdgeInsets.only(left: kNormalPadding),
                        child: HookBuilder(
                          builder: (context) {
                            final controller = useTextEditingController();

                            return Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextField(
                                    controller: controller,
                                    cursorColor: Theme.of(context).primaryColor,
                                    decoration: InputDecoration(border: InputBorder.none, hintText: translations.menuAddRoom),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () async {
                                    await drawerStore.addRoom(controller.text);
                                    controller.text = '';
                                  },
                                  tooltip: translations.menuAddRoom,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _RoomListEntry extends HookWidget {
  final Room room;

  const _RoomListEntry({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roomWidgetState = useState(_RoomState.idle);
    final roomWidget = useMemoized(
        () => roomWidgetState.value == _RoomState.idle
            ? _RoomIdle(room: room)
            : _RoomEdition(
                room: room,
              ),
        [room, roomWidgetState.value]);

    return ListenableProvider.value(
      value: roomWidgetState,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: roomWidget,
          ),
          Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}

class _RoomIdle extends StatelessWidget {
  final Room room;
  static const height = 55.0;

  const _RoomIdle({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final drawerStore = Provider.of<DrawerStore>(context);
    return InkWell(
      child: Container(
        height: height,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: kHugePadding),
                child: Text(
                  room.name.toUpperCase(),
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            PopupMenuButton<_RoomAction>(
              onSelected: (action) async {
                if (action == _RoomAction.delete) {
                  final confirm = await showConfirm(context, translations.deleteItem(room.name), translations.deleteConfirm);
                  if (confirm) {
                    showLoadingDialog(context, (_) => Text(translations.deleting), () => Provider.of<DrawerStore>(context, listen: false).deleteRoom(room.id));
                  }
                } else if (action == _RoomAction.rename) {
                  Provider.of<ValueNotifier<_RoomState>>(context, listen: false).value = _RoomState.edition;
                }
              },
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: kNormalPadding),
                        child: Icon(Icons.edit, semanticLabel: translations.rename),
                      ),
                      Expanded(child: Text(translations.rename)),
                    ],
                  ),
                  value: _RoomAction.rename,
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: kNormalPadding),
                        child: Icon(Icons.delete, semanticLabel: translations.delete),
                      ),
                      Expanded(child: Text(translations.delete)),
                    ],
                  ),
                  value: _RoomAction.delete,
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        final route = '${RoomDashboard.route}/${room.id}';
        if (drawerStore.currentSelectedRoute != route) {
          Provider.of<GlobalKey<NavigatorState>>(context, listen: false).currentState.pushNamed(RoomDashboard.route, arguments: room);
          _closeDrawer(context);
          drawerStore.selectRoute(route);
        }
      },
    );
  }

  void _closeDrawer(BuildContext context) {
    if (ProxyScaffold.isMobileView(context)) {
      Navigator.of(context).pop();
    }
  }
}

class _RoomEdition extends HookWidget {
  final Room room;

  const _RoomEdition({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final controller = useTextEditingController(text: room.name);
    final drawerStore = Provider.of<DrawerStore>(context);
    return Container(
      padding: EdgeInsets.only(left: kSmallPadding),
      height: DrawerEntry.height,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  tooltip: translations.continueButton,
                  icon: Icon(Icons.send, semanticLabel: translations.continueButton),
                  onPressed: () {
                    Provider.of<ValueNotifier<_RoomState>>(context, listen: false).value = _RoomState.idle;
                    drawerStore.renameRoom(room, controller.text);
                  },
                ),
              ),
            ),
          ),
          IconButton(
            tooltip: translations.cancel,
            icon: Icon(
              Icons.cancel,
              semanticLabel: translations.cancel,
            ),
            onPressed: () {
              Provider.of<ValueNotifier<_RoomState>>(context, listen: false).value = _RoomState.idle;
            },
          ),
        ],
      ),
    );
  }
}

enum _RoomAction {
  rename,
  delete,
}

enum _RoomState {
  idle,
  edition,
}
