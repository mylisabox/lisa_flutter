import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/favorites/presentation/favorites.dart';
import 'package:lisa_server_sdk/api/room_api.dart';
import 'package:lisa_server_sdk/model/room.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'drawer_bloc.g.dart';

class DrawerBloc = _DrawerBloc with _$DrawerBloc;

abstract class _DrawerBloc with Store {
  final RoomApi _roomApi;
  final _log = Logger('DrawerBloc');

  _DrawerBloc({RoomApi roomApi}) : _roomApi = roomApi ?? BackendApiProvider().api.getRoomApi();

  @observable
  List<Room> rooms = [];

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
  Future loadRooms({force: false}) async {
    if (rooms.isEmpty || force) {
      rooms = await _roomApi.getRooms();
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
  void selectRoute(String route) {
    currentSelectedRoute = route;
  }
}
