import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/loading.dart';
import 'package:lisa_flutter/src/common/presentation/refresh_no_scroll_content.dart';
import 'package:lisa_flutter/src/common/utils/base_url_provider.dart';
import 'package:lisa_flutter/src/common/utils/extensions.dart';
import 'package:lisa_flutter/src/devices/stores/device_store.dart';
import 'package:lisa_flutter/src/rooms/stores/room_store.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:remote_color_picker/remote_color_picker.dart';
import 'package:remote_image_button/remote_image_button.dart';
import 'package:remote_ip_camera/remote_ip_camera.dart';
import 'package:remote_ui/remote_ui.dart';

class DeviceListScreen extends HookWidget {
  static const route = '/deviceList';
  final DeviceTypeEnum type;

  const DeviceListScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = useMemoized(() => DeviceStore());
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: Text(context.localizations.typeLabel(type)),
      ),
      body: Provider(
          create: (BuildContext context) => store, child: type == DeviceTypeEnum.webcam ? _DeviceListDetails(type: type) : _RoomListDetails(type: type)),
    );
  }
}

class _RoomListDetails extends StatelessWidget {
  final DeviceTypeEnum type;

  const _RoomListDetails({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roomStore = context.of<RoomStore>();
    return Observer(
      builder: (context) => ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(top: kNormalPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            roomStore.triggerRoom(null, type, false).catchError((error, stack) {
                              showErrorDialog(context, error, stack);
                            });
                          },
                          child: Text(context.localizations.deviceTurnOff)),
                      OutlinedButton(
                          onPressed: () {
                            roomStore.triggerRoom(null, type, true).catchError((error, stack) {
                              showErrorDialog(context, error, stack);
                            });
                          },
                          child: Text(context.localizations.deviceTurnOn)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kNormalPadding),
                    child: Text(context.localizations.menuRooms),
                  ),
                ],
              ),
            );
          }
          return _RoomEntry(type: type, room: roomStore.availableRooms[index - 1]);
        },
        itemCount: roomStore.availableRooms.length + 1,
      ),
    );
  }
}

class _RoomEntry extends StatelessWidget {
  final Room room;
  final DeviceTypeEnum type;

  const _RoomEntry({Key? key, required this.room, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roomStore = context.of<RoomStore>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kNormalPadding, vertical: kNormalPadding / 3),
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kSmallPadding),
          ),
          color: context.theme.dialogBackgroundColor,
        ),
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: kNormalPadding),
                  child: Align(alignment: Alignment.centerLeft, child: Text(room.name, style: context.textTheme.subtitle1)),
                ),
              ),
            ),
            const VerticalDivider(width: 1),
            TextButton(
              onPressed: () {
                roomStore.triggerRoom(room, type, false).catchError((error, stack) {
                  showErrorDialog(context, error, stack);
                });
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: kNormalPadding),
                child: Text('O', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ),
            ),
            const VerticalDivider(width: 1),
            TextButton(
              onPressed: () {
                roomStore.triggerRoom(room, type, true).catchError((error, stack) {
                  showErrorDialog(context, error, stack);
                });
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: kNormalPadding),
                child: Text('⎮', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeviceListDetails extends HookWidget with BaseUrlProvider {
  final DeviceTypeEnum type;

  const _DeviceListDetails({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.of<DeviceStore>();
    final roomStore = context.of<RoomStore>();
    useEffect(() {
      store.loadDevices(roomStore.webcams);
    }, const []);
    return Observer(
      builder: (context) {
        if (store.loadDeviceListRequest?.status == FutureStatus.rejected) {
          return RefreshIndicatorContentError(error: store.loadDeviceListRequest!.error);
        }

        if (store.loadDeviceListRequest?.status == FutureStatus.pending) {
          return const Loading();
        }
        final devices = store.deviceList;
        return Scrollbar(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final device = devices[index];
              return Card(
                margin: const EdgeInsets.all(kNormalPadding),
                child: SizedBox(
                  height: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(kNormalPadding),
                        child: Text(device.name, style: context.textTheme.subtitle1),
                      ),
                      const Divider(height: 1),
                      Expanded(
                        child: RemoteManagerWidget(
                          onChanges: (String key, value, {associatedData}) {
                            store.deviceChange(key, value, deviceToChange: device);
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
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemCount: devices.length,
          ),
        );
      },
    );
  }
}
