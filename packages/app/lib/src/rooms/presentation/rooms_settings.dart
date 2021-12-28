import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/utils/extensions.dart';
import 'package:lisa_flutter/src/rooms/stores/room_store.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';

class RoomsSettingsScreen extends HookWidget {
  static const route = '/roomsSettings';

  const RoomsSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roomStore = context.of<RoomStore>();
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: Text(context.localizations.menuRooms),
      ),
      body: const RoomsSettingsWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final name = await showPrompt(context, context.localizations.nameField);

          if (name != null && name.isNotEmpty) {
            roomStore
                .addRoom((RoomBuilder()
                      ..name = name
                      ..sortOrder = 100)
                    .build())
                .catchError((err, stack) {
              showErrorDialog(context, err, stack);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class RoomsSettingsWidget extends HookWidget {
  const RoomsSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roomStore = context.of<RoomStore>();
    return Observer(builder: (context) {
      return ReorderableListView.builder(
        itemBuilder: (context, index) {
          final room = roomStore.availableRooms[index];
          return Column(
            key: ValueKey(room.id),
            children: [
              Slidable(
                closeOnScroll: true,
                endActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  children: <Widget>[
                  SlidableAction(
                    label: context.localizations.rename,
                    backgroundColor: context.primaryColor,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    onPressed: (context) async {
                      final name = await showPrompt(context, context.localizations.rename, initialValue: room.name);

                      if (name != null && name.isNotEmpty) {
                        roomStore.renameRoom(room, name).catchError((err, stack) {
                          showErrorDialog(context, err, stack);
                        });
                      }
                    },
                  ),
                  SlidableAction(
                    label: context.localizations.delete,
                    backgroundColor: Colors.red,
                    icon: Icons.delete_outline,
                    onPressed: (context) async {
                      final success = await showConfirm(context, context.localizations.deleteItem(room.name), context.localizations.deleteConfirm);

                      if (success) {
                        roomStore.deleteRoom(room).catchError((err, stack) {
                          showErrorDialog(context, err, stack);
                        });
                      }
                    },
                  ),
                ],),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(kNormalPadding),
                        child: Text(room.name, style: context.textTheme.subtitle1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: kNormalPadding),
                      child: ReorderableDragStartListener(
                        index: index,
                        child: const Icon(Icons.reorder),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1)
            ],
          );
        },
        itemCount: roomStore.availableRooms.length,
        onReorder: (i1, i2) {
          roomStore.reorder(i1, i2);
        },
      );
    });
  }
}
