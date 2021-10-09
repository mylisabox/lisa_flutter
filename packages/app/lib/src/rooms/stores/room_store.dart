import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:collection/collection.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/utils/disposable.dart';
import 'package:lisa_flutter/src/common/utils/extensions.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';

part 'room_store.g.dart';

class RoomStore = _RoomStore with _$RoomStore;

abstract class _RoomStore with Store, Disposable {
  final _log = Logger('RoomStore');
  final RoomApi _roomApi;
  final DeviceApi _deviceApi;

  @observable
  ObservableFuture<List<Room>> roomsStatus = ObservableFuture.value([]);

  @computed
  List<Room> get rooms => _prepareRooms();

  @computed
  List<Room> get availableRooms => roomsStatus.value?.where((element) => element.id != -1).toList(growable: false) ?? [];

  @computed
  bool get hasLights =>
      roomsStatus.value?.firstWhereOrNull((room) => room.devices.firstWhereOrNull((device) => device.type == DeviceTypeEnum.light) != null) != null;

  @computed
  bool get hasShutters =>
      roomsStatus.value?.firstWhereOrNull((room) => room.devices.firstWhereOrNull((device) => device.type == DeviceTypeEnum.shutter) != null) != null;

  @computed
  bool get hasWebcams =>
      roomsStatus.value?.firstWhereOrNull((room) => room.devices.firstWhereOrNull((device) => device.type == DeviceTypeEnum.webcam) != null) != null;

  _RoomStore({
    RoomApi? roomApi,
    DeviceApi? deviceApi,
  })  : _roomApi = roomApi ?? BackendApiProvider().api.getRoomApi(),
        _deviceApi = deviceApi ?? BackendApiProvider().api.getDeviceApi() {
    subscriptions.add(
      BackendApiProvider().websocketManager.onMessage.listen(
        (event) {
          if (event.type.contains('device')) {
            _updateDevice(event.data as Device);
          }
        },
      ),
    );
  }

  @action
  Future<void> deleteDevice(Device device) async {
    await _deviceApi.deleteDevice(deviceId: device.id);
    await reloadRooms();
  }

  @action
  Future<void> deleteRoom(Room room) async {
    await _roomApi.deleteRoom(roomId: room.id!);
    await reloadRooms();
  }

  @action
  Future<void> renameRoom(Room room, String newName) async {
    await _roomApi.saveRoom(roomId: room.id!, room: room.rebuild((p0) => p0.name = newName));
    await reloadRooms();
  }

  @action
  Future<Room> addRoom(Room room) async {
    final newRoom = await _roomApi.addRoom(room: room);
    await reloadRooms();
    return newRoom.data!;
  }

  Future<void> triggerRoom(Room? room, DeviceTypeEnum type, bool state) async {
    await _deviceApi.triggerGroup(
        deviceType: type.name,
        roomId: room?.id,
        requestBody: BuiltMap.of({
          'key': JsonObject('powered'),
          'value': JsonObject(state),
        }));
    return;
  }

  Future<void> reorder(int i1, int i2) async {
    final rooms = List.from(availableRooms);
    var add = 0;
    if (i1 < i2) {
      add = 1;
    }
    rooms.insert(i2-add, rooms.removeAt(i1));
    await _roomApi.reorderRooms(requestBody: BuiltList.of(rooms.map((e) => e.id)));
    await reloadRooms();
  }

  Future<void> triggerDevice(Device device) async {
    if (device.grouped ?? false) {
      await _deviceApi.triggerGroup(
          deviceType: device.type.name,
          roomId: device.roomId,
          requestBody: BuiltMap.of({
            'key': JsonObject('powered'),
            'value': JsonObject(!device.powered),
          }));
      return;
    }
    await _deviceApi.triggerDevice(deviceId: device.id);
  }

  Device _prepareDevice(Device device) {
    return device.rebuild((d) {
      if (d.type == DeviceTypeEnum.light && device.defaultAction == null) {
        d.defaultAction = device.powered ? 'Turn off' : 'Turn on';
      }
      if (device.imageOn == null) {
        d.imageOn = DeviceExtension.getImage(device.type, true);
      }
      if (device.imageOff == null) {
        d.imageOff = DeviceExtension.getImage(device.type, false);
      }
      return d;
    });
  }

  Device _createGroup(
    List<Device> devices, {
    required String name,
    required int sortOrder,
  }) {
    return DeviceExtension.createGroup(devices, name, sortOrder);
  }

  List<Room> _prepareRooms() {
    return roomsStatus.value?.where((element) {
          return element.devices.isNotEmpty;
        }).map((room) {
          return room.rebuild((r) {
            final devices = <Device>[];
            final lights = room.devices.where((device) => device.type == DeviceTypeEnum.light);
            Device? light;
            if (lights.length > 1) {
              devices.add(_createGroup(
                lights.toList(growable: false),
                name: 'Lights',
                sortOrder: 1,
              ));
            } else {
              light = lights.firstOrNull;
              if (light != null) {
                devices.add(_prepareDevice(light));
              }
            }

            final shutters = room.devices.where((device) => device.type == DeviceTypeEnum.shutter);
            Device? shutter;
            if (shutters.length > 1) {
              devices.add(_createGroup(
                shutters.toList(growable: false),
                name: 'Shutters',
                sortOrder: 2,
              ));
            } else {
              shutter = shutters.firstOrNull;
              if (shutter != null) {
                devices.add(_prepareDevice(shutter));
              }
            }

            final speakers = room.devices.where((device) => device.type == DeviceTypeEnum.speaker);
            Device? speaker;
            if (speakers.length > 1) {
              devices.add(_createGroup(
                speakers.toList(growable: false),
                name: 'Speakers',
                sortOrder: 3,
              ));
            } else {
              speaker = speakers.firstOrNull;
              if (speaker != null) {
                devices.add(_prepareDevice(speaker));
              }
            }

            devices.addAll(room.devices
                .where((device) => device.type != DeviceTypeEnum.light && device.type != DeviceTypeEnum.shutter && device.type != DeviceTypeEnum.speaker)
                .map((device) => _prepareDevice(device)));

            r.devices = ListBuilder(devices);
            return r;
          });
        }).toList() ??
        [];
  }

  @action
  Future<void> loadRooms() async {
    BackendApiProvider().setupWebsocket();
    final roomsFuture = _roomApi.getRooms().then((value) => value.data!.toList());
    roomsStatus = ObservableFuture(roomsFuture);
    await roomsFuture;
  }

  @action
  Future<void> reloadRooms() async {
    BackendApiProvider().setupWebsocket();
    final roomsFuture = _roomApi.getRooms().then((value) => value.data!.toList());
    await roomsFuture;
    roomsStatus = ObservableFuture(roomsFuture);
  }

  @override
  void dispose() {
    for (var sub in subscriptions) {
      sub.cancel();
    }
  }

  void _updateDevice(Device data) {
    var room = roomsStatus.value!.firstWhereOrNull((element) => element.id == data.roomId);
    room ??= roomsStatus.value!.firstWhere((element) => element.id == -1);
    final roomIndex = roomsStatus.value!.indexOf(room);
    final devices = List<Device>.from(room.devices);
    final deviceIndex = devices.indexWhere((element) => element.id == data.id);
    if (deviceIndex == -1) {
      devices.add(data);
    } else {
      devices.replaceRange(deviceIndex, deviceIndex + 1, [data]);
    }
    room = room.rebuild((r) {
      r.devices = ListBuilder<Device>(devices);
      return r;
    });
    final updatedRooms = List<Room>.from(roomsStatus.value!)..replaceRange(roomIndex, roomIndex + 1, [room]);
    roomsStatus = ObservableFuture.value(updatedRooms);
  }
}
