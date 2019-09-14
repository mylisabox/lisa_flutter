import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/drawer/stores/drawer_store.dart';
import 'package:lisa_server_sdk/model/room.dart';
import 'package:provider/provider.dart';

class RoomSelector extends HookWidget {
  final bool isExpanded;
  final int selected;
  final void Function(Room room) onRoomSelected;

  const RoomSelector({Key key, this.selected, this.isExpanded = false, this.onRoomSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerStore = Provider.of<DrawerStore>(context);
    final selectedRoom = useMemoized(() => drawerStore.rooms.firstWhere((room) => room.id == selected, orElse: () => null), [selected]);

    useEffect(() {
      if (drawerStore.rooms.isEmpty) {
        drawerStore.loadRooms();
      }
      return null;
    }, const []);

    return Observer(
      builder: (BuildContext context) {
        final translations = CommonLocalizations.of(context);
        final roomList = drawerStore.rooms;
        return DropdownButton<Room>(
          onChanged: onRoomSelected,
          isExpanded: isExpanded,
          value: selectedRoom,
          hint: Padding(
            padding: const EdgeInsets.all(kSmallPadding),
            child: Text(translations.selectRoom),
          ),
          items: roomList
              .map(
                (room) => DropdownMenuItem(
                  value: room,
                  child: Text(room.name),
                ),
              )
              .toList(growable: false),
        );
      },
    );
  }
}
