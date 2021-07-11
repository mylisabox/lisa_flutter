import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/favorites/presentation/favorites.dart';
import 'package:lisa_flutter/src/preferences/preferences_provider.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'drawer_store.g.dart';

class DrawerStore = _DrawerStore with _$DrawerStore;

abstract class _DrawerStore with Store {
  final PreferencesProvider _preferencesProvider;
  final RoomApi _roomApi;
  static const String _keyRoomListOpened = 'roomListOpened';
  final _log = Logger('DrawerStore');

  _DrawerStore({
    RoomApi? roomApi,
    PreferencesProvider? preferencesProvider,
  })  : _roomApi = roomApi ?? BackendApiProvider().api.getRoomApi(),
        _preferencesProvider = preferencesProvider ?? PreferencesProvider();

  @observable
  ObservableList<Room> rooms = ObservableList();

  @observable
  String currentSelectedRoute = FavoritesWidget.route;

  @computed
  int get roomNumber => rooms.length + 1;

  @observable
  bool isRoomListOpened = false;

  @action
  Future<void> toggleListOpened() async {
    isRoomListOpened = !isRoomListOpened;
    await _preferencesProvider.prefs.setBool(_keyRoomListOpened, isRoomListOpened);
    if (isRoomListOpened && rooms.isEmpty) {
      await loadRooms();
    }
  }

  @action
  Future loadRooms({bool force: false}) async {
    if (rooms.isEmpty || force) {
      rooms = ObservableList.of((await _roomApi.getRooms()).data!);
      isRoomListOpened = _preferencesProvider.prefs.getBool(_keyRoomListOpened) ?? false;
    }
  }

  @action
  Future addRoom(String name) async {
    if (name.length > 3) {
      await _roomApi.addRoom(room: (RoomBuilder()..name = name).build()).catchError(handleCaughtError);
      await loadRooms(force: true);
    }
  }

  @action
  Future renameRoom(Room room, String name) async {
    if (name.length > 3) {
      await _roomApi
          .saveRoom(
              roomId: room.id!,
              room: (RoomBuilder()
                    ..id = room.id
                    ..name = name)
                  .build())
          .catchError(handleCaughtError);
      await loadRooms(force: true);
    }
  }

  @action
  Future deleteRoom(int id) async {
    await _roomApi.deleteRoom(roomId: id).catchError(handleCaughtError);
    rooms.remove(rooms.firstWhere((item) => item.id == id));
  }

  @action
  void selectRoute(String route) {
    currentSelectedRoute = route;
    _preferencesProvider.prefs.setString(PreferencesProvider.keyLastRoute, route);
  }
}
