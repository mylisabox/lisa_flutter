import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/loading.dart';
import 'package:lisa_flutter/src/common/presentation/refresh_no_scroll_content.dart';
import 'package:lisa_flutter/src/common/presentation/widgets/light.dart';
import 'package:lisa_flutter/src/common/utils/base_url_provider.dart';
import 'package:lisa_flutter/src/common/utils/extensions.dart';
import 'package:lisa_flutter/src/devices/presentation/room_selector.dart';
import 'package:lisa_flutter/src/devices/stores/device_store.dart';
import 'package:lisa_flutter/src/rooms/stores/room_store.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:remote_color_picker/remote_color_picker.dart';
import 'package:remote_image_button/remote_image_button.dart';
import 'package:remote_ip_camera/remote_ip_camera.dart';
import 'package:remote_ui/remote_ui.dart';

class DeviceScreen extends HookWidget {
  static const route = '/device';
  final Device device;

  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = useMemoized(() => DeviceStore());
    return Scaffold(
      appBar: AppBar(
        title: Text(device.name),
        actions: [
          if (!(device.grouped ?? false))
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return HookBuilder(builder: (context) {
                          final roomStore = context.of<RoomStore>();
                          final nameController = useTextEditingController(text: device.name);
                          final roomState = useState<Room?>(roomStore.availableRooms.firstWhereOrNull((element) => element.id == device.roomId));
                          return LisaDialog(
                            title: Text(device.name),
                            content: Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(label: Text(context.localizations.nameField)),
                                  controller: nameController,
                                ),
                                RoomSelector(
                                  onRoomSelected: (room) {
                                    roomState.value = room;
                                  },
                                  allowAddRoom: false,
                                  selectedRoom: roomState.value,
                                ),
                              ],
                            ),
                            actions: [
                              DialogAction(
                                text: MaterialLocalizations.of(context).cancelButtonLabel,
                                callback: (context) {
                                  Navigator.of(context).pop();
                                },
                              ),
                              DialogAction(
                                text: MaterialLocalizations.of(context).saveButtonLabel,
                                callback: (context) {
                                  final name = nameController.text;
                                  final room = roomState.value;
                                  store.saveDevice(device, name: name, roomId: room?.id);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                      });
                },
                icon: const Icon(Icons.edit)),
        ],
      ),
      body: Provider(create: (BuildContext context) => store..loadDevice(device), child: const DeviceDetails()),
    );
  }
}

class DeviceDetails extends StatelessWidget with BaseUrlProvider {
  const DeviceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.of<DeviceStore>();
    return Observer(builder: (context) {
      if (store.loadDeviceRequest?.status == FutureStatus.rejected) {
        return RefreshIndicatorContentError(error: store.loadDeviceRequest!.error);
      }

      if (store.device == null) {
        return const Loading();
      }
      final device = store.device!;
      return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if ((device.grouped ?? false))
            Center(
              child: Padding(
                padding: const EdgeInsets.all(kNormalPadding),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    context.localizations.groupDevices(device.children!.length),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          if (device.template != null)
            Expanded(
              child: RemoteManagerWidget(
                onChanges: (String key, value, {associatedData}) {
                  store.deviceChange(key, value);
                },
                parsers: [
                  RemoteColorPickerFactory(),
                  RemoteIpCameraFactory(baseUrlProvider: () {
                    final backend = BackendApiProvider();
                    final interceptor = backend.api.dio.interceptors.firstWhere((item) => item is HostInterceptor); //get host interceptor
                    final token = backend.getToken();
                    return (interceptor as HostInterceptor).host! + '/api/v1/camera/stream?token=$token&url=';
                  }),
                  RemoteImageButtonFactory(baseUrlProvider: () => baseUrl)
                ],
                child: Padding(
                  padding: const EdgeInsets.all(kNormalPadding),
                  child: RemoteWidget(
                    associatedData: device,
                    definition: device.template!.toMap().map((key, value) {
                      return MapEntry(key, value.toPrimitive());
                    }),
                    data: device.data == null
                        ? {}
                        : device.data!.toMap().map((key, value) {
                            return MapEntry(key, value.toPrimitive());
                          }),
                  ),
                ),
              ),
            ),
          if (device.type == DeviceTypeEnum.light)
            Light(
              key: ValueKey(device.name),
              powered: device.powered,
              dimmable: device.data?['dimmable']?.asBool ?? false,
              brightness: device.data?['intensity']?.asNum.toInt(),
              color: device.data?['color']?.asString.toColor(),
              onPoweredChange: (bool powered) {
                store.deviceChange('powered', powered);
              },
              onBrightnessChange: (int brightness) {
                store.deviceChange('intensity', brightness);
              },
              onColorChange: (Color color) {
                store.deviceChange('color', color.toHex());
              },
            ),
        ],
      );
    });
  }
}
