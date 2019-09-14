import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/favorites/presentation/favorites.dart';
import 'package:lisa_server_sdk/api/room_api.dart';
import 'package:lisa_server_sdk/model/room.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'drawer_store.g.dart';

class DrawerStore = _DrawerStore with _$DrawerStore;

abstract class _DrawerStore with Store {
  final RoomApi _roomApi;
  final _log = Logger('DrawerStore');

  _DrawerStore({RoomApi roomApi}) : _roomApi = roomApi ?? BackendApiProvider().api.getRoomApi();

  @observable
  ObservableList<Room> rooms = ObservableList();

  @observable
  String currentSelectedRoute = FavoritesWidget.route;

  @computed
  int get roomNumber => rooms.length + 1;

  @observable
  bool isRoomListOpened = false;

  @action
  void toggleListOpened() {
    isRoomListOpened = !isRoomListOpened;
  }

  @action
  Future loadRooms({bool force: false}) async {
    if (rooms.isEmpty || force) {
      rooms = ObservableList.of(await _roomApi.getRooms());
    }
  }

  @action
  Future addRoom(String name) async {
    if (name != null && name.length > 3) {
      await _roomApi.addRoom(Room(name: name)).catchError(handleCaughtError);
      await loadRooms(force: true);
    }
  }

  @action
  Future renameRoom(Room room, String name) async {
    if (name != null && name.length > 3) {
      await _roomApi.saveRoom(room.id, Room(id: room.id, name: name)).catchError(handleCaughtError);
      await loadRooms(force: true);
    }
  }

  @action
  Future deleteRoom(int id) async {
    await _roomApi.deleteRoom(id).catchError(handleCaughtError);
    rooms.remove(rooms.firstWhere((item) => item.id == id));
  }

  @action
  void selectRoute(String route) {
    currentSelectedRoute = route;
  }
}
