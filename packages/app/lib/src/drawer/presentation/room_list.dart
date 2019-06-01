import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/proxy_scaffold.dart';
import 'package:lisa_flutter/src/common/utils/hooks.dart';
import 'package:lisa_flutter/src/drawer/bloc/drawer_bloc.dart';
import 'package:lisa_flutter/src/drawer/presentation/drawer.dart';
import 'package:lisa_flutter/src/rooms/presentation/room_dashboard.dart';
import 'package:provider/provider.dart';

class RoomList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final drawerBloc = Provider.of<DrawerBloc>(context);
    final rotationController = useAnimationController(duration: Duration(milliseconds: 200), initialValue: drawerBloc.isRoomListOpened ? 1 : 0);

    useEffect(() {
      drawerBloc.loadRooms();
      return null;
    }, [drawerBloc]);

    return Observer(
      builder: (context) {
        return Column(
          children: <Widget>[
            Material(
              elevation: drawerBloc.isRoomListOpened ? 2 : 0,
              child: DrawerEntry(
                text: translations.menuRooms,
                icon: Icons.home,
                trailing: RotationTransition(
                  child: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).primaryColor),
                  turns: Tween(begin: .0, end: .25).animate(rotationController),
                ),
                onTap: () {
                  drawerBloc.toggleListOpened();
                  if (drawerBloc.isRoomListOpened) {
                    rotationController.forward();
                  } else {
                    rotationController.reverse();
                  }
                },
              ),
            ),
            Visibility(
              visible: drawerBloc.isRoomListOpened,
              child: Divider(
                height: 1,
              ),
            ),
            AnimatedContainer(
              alignment: Alignment.topCenter,
              duration: Duration(milliseconds: min(drawerBloc.roomNumber * 200, 400)),
              height: drawerBloc.isRoomListOpened ? drawerBloc.roomNumber * DrawerEntry.height + 1 : .0,
              child: ClipRect(
                child: OverflowBox(
                  maxHeight: drawerBloc.roomNumber * DrawerEntry.height + 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var room in drawerBloc.rooms) ...[
                        DrawerEntry(
                          text: room.name,
                          onTap: () {
                            final route = '${RoomDashboard.route}/${room.id}';
                            if (drawerBloc.currentSelectedRoute != route) {
                              Provider.of<GlobalKey<NavigatorState>>(context).currentState.pushNamed(RoomDashboard.route, arguments: room);
                              _closeDrawer(context);
                              drawerBloc.selectRoute(route);
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
                                    await drawerBloc.addRoom(controller.text);
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
