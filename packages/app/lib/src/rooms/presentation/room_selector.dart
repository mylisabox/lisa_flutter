import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/rooms/stores/room_store.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:provider/provider.dart';

class RoomSelector extends HookWidget {
  final bool isExpanded;
  final int? selected;
  final void Function(Room room) onRoomSelected;

  const RoomSelector({Key? key, this.selected, this.isExpanded = false, required this.onRoomSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roomStore = Provider.of<RoomStore>(context);
    final selectedRoom = useMemoized(() => roomStore.availableRooms.firstWhereOrNull((room) => room.id == selected), [selected]);

    useEffect(() {
      if (roomStore.rooms.isEmpty) {
        roomStore.loadRooms();
      }
      return null;
    }, const []);

    return Observer(
      builder: (BuildContext context) {
        final translations = CommonLocalizations.of(context);
        final roomList = roomStore.availableRooms;
        return DropdownButton<Room>(
          onChanged: (room) => onRoomSelected(room!),
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
