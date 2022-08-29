import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/utils/extensions.dart';
import 'package:lisa_flutter/src/rooms/stores/room_store.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';

class RoomSelector extends StatelessWidget {
  final void Function(Room) onRoomSelected;
  final Room? selectedRoom;
  final bool allowAddRoom;

  const RoomSelector({Key? key, this.allowAddRoom = true, this.selectedRoom, required this.onRoomSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roomStore = context.of<RoomStore>();
    final translations = CommonLocalizations.of(context);

    return Observer(
      builder: (context) {
        final rooms = List<Room>.from(roomStore.availableRooms);
        if (allowAddRoom) {
          rooms.add((RoomBuilder()
                ..name = translations.menuAddRoom
                ..id = -1
                ..sortOrder = 100)
              .build());
        }

        return DropdownButtonFormField<Room>(
          onChanged: (room) async {
            if (room?.id == -1) {
              final roomName = await showPrompt(context, translations.menuAddRoom);
              if (roomName != null) {
                final newRoom = await roomStore.addRoom(Room((b) => b
                  ..name = roomName
                  ..sortOrder = 100));
                onRoomSelected(newRoom);
              }
            } else if (room != null) {
              onRoomSelected(room);
            }
          },
          decoration: InputDecoration(label: Text(translations.selectRoom)),
          value: selectedRoom,
          isExpanded: true,
          items: rooms
              .map(
                (r) => DropdownMenuItem<Room>(
                  child: Text(r.name),
                  value: r,
                ),
              )
              .toList(growable: false),
        );
      },
    );
  }
}
