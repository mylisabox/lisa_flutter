import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/proxy_scaffold.dart';
import 'package:lisa_flutter/src/common/utils/hooks.dart';
import 'package:lisa_flutter/src/drawer/presentation/drawer.dart';
import 'package:lisa_flutter/src/drawer/stores/drawer_store.dart';
import 'package:lisa_flutter/src/rooms/presentation/room_dashboard.dart';
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
                  maxHeight: drawerStore.roomNumber * DrawerEntry.height + 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var room in drawerStore.rooms) ...[
                        DrawerEntry(
                          text: room.name,
                          onTap: () {
                            final route = '${RoomDashboard.route}/${room.id}';
                            if (drawerStore.currentSelectedRoute != route) {
                              Provider.of<GlobalKey<NavigatorState>>(context).currentState.pushNamed(RoomDashboard.route, arguments: room);
                              _closeDrawer(context);
                              drawerStore.selectRoute(route);
                            }
                          },
                        ),
                        Divider(
                          height: 1,
                        ),
                      ],
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

  void _closeDrawer(BuildContext context) {
    if (ProxyScaffold.isMobileView(context)) {
      Navigator.of(context).pop();
    }
  }
}
