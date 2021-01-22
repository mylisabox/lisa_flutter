import 'dart:math';

import 'package:built_value/json_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/refresh_no_scroll_content.dart';
import 'package:lisa_flutter/src/common/utils/base_url_provider.dart';
import 'package:lisa_flutter/src/devices/stores/device_store.dart';
import 'package:lisa_flutter/src/rooms/presentation/room_selector.dart';
import 'package:lisa_server_sdk/auth/api_key_auth.dart';
import 'package:lisa_server_sdk/model/device.dart';
import 'package:provider/provider.dart';
import 'package:remote_color_picker/remote_color_picker.dart';
import 'package:remote_image_button/remote_image_button.dart';
import 'package:remote_ip_camera/remote_ip_camera.dart';
import 'package:remote_ui/remote_ui.dart';

class Dashboard extends HookWidget {
  static const _widgetWidthSize = 300.0; //min size in DPI for a widget
  static const _widgetWidthUnit = 8; // width unit in grid for a widget 1 = 8
  static const _widgetHeightUnit = 5; // height unit in grid for a widget 1 = 4
  final int roomId;

  const Dashboard({Key key, this.roomId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final store = Provider.of<DeviceStore>(context);
    final callback = useMemoized(
      () => (String key, value, {associatedData}) => store.deviceChange(key, value, associatedData: associatedData).catchError(
            (err, stack) {
              showErrorDialog(context, err, stack);
            },
          ),
      [store],
    );

    return RemoteManagerWidget(
      parsers: [
        RemoteColorPickerFactory(),
        RemoteIpCameraFactory(baseUrlProvider: () {
          final backend = BackendApiProvider();
          final HostInterceptor interceptor = backend.interceptors.firstWhere((item) => item is HostInterceptor); //get host interceptor
          final token = (backend.api.dio.interceptors.firstWhere((item) => item is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor)
              .apiKeys[kAuthKey]
              .replaceFirst('JWT ', '');
          return interceptor.host + '/api/v1/camera/stream?token=$token&url=';
        }),
        RemoteImageButtonFactory(baseUrlProvider: () => BaseUrlProvider.getBaseUrl())
      ],
      onChanges: callback,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return RefreshIndicator(
            onRefresh: () {
              return store.refreshDevices();
            },
            child: Observer(
              builder: (context) {
                if (store.error != null) {
                  return RefreshIndicatorContent(
                    child: Center(
                      child: Text(
                        store.error.cause.twoLiner(context),
                        style: TextStyle(color: Theme.of(context).errorColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }

                if (store.devices == null) {
                  return Center(child: CircularProgressIndicator());
                }
                if (store.devices.length == 0) {
                  return RefreshIndicatorContent(
                    child: Center(child: Text(translations.emptyList)),
                  );
                }
                return AnimationLimiter(
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: (constraints.maxWidth / _widgetWidthSize).floor() * _widgetWidthUnit,
                    itemCount: store.devices.length,
                    staggeredTileBuilder: (int index) {
                      final device = store.devices[index];
                      final num width = device?.template['widgetWidth']?.asNum ?? 1;
                      final num height = device?.template['widgetHeight']?.asNum ?? 1;
                      return StaggeredTile.count(width * _widgetWidthUnit, height.toDouble() * _widgetHeightUnit);
                    },
                    mainAxisSpacing: kSmallPadding,
                    crossAxisSpacing: kSmallPadding,
                    itemBuilder: (context, index) {
                      final device = store.devices[index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 450),
                        child: SlideAnimation(
                          verticalOffset: 70.0,
                          child: FadeInAnimation(child: _DashboardWidget(device: device)),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _DashboardWidget extends HookWidget {
  final Device device;

  const _DashboardWidget({Key key, this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mode = useState(_DeviceState.idle);
    final deviceWidget = useMemoized(
      () => mode.value == _DeviceState.idle ? _DeviceIdle(device: device) : _DeviceEdition(device: device),
      [device, mode.value],
    );
    return ListenableProvider.value(
      value: mode,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: deviceWidget,
        transitionBuilder: (child, animation) {
          return AnimatedBuilder(
            child: child,
            animation: animation,
            builder: (context, child) {
              final transform = Matrix4.identity();
              //transform.setEntry(3, 2, 0.001);//FIXME 3D effect but look weird
              transform.rotateY((1 - animation.value) * pi / 2);
              return Transform(
                transform: transform,
                alignment: Alignment.center,
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}

class _DeviceIdle extends StatelessWidget {
  final Device device;

  const _DeviceIdle({Key key, this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(kSmallPadding),
                  child: Text(device.name),
                ),
              ),
              ClipRect(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(kSmallPadding),
                    child: Icon(
                      device.favorite ?? false ? Icons.star : Icons.star_border,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onTap: () {
                    final store = Provider.of<DeviceStore>(context, listen: false);
                    store.toggleFavorite(device.id, device.favorite).catchError(
                      (err, stack) {
                        showErrorDialog(context, err, stack);
                      },
                    );
                  },
                ),
              ),
              ClipRect(
                child: PopupMenuButton<_DeviceAction>(
                  onSelected: (action) async {
                    final store = Provider.of<DeviceStore>(context, listen: false);
                    if (action == _DeviceAction.delete) {
                      final confirm = await showConfirm(context, translations.deleteItem(device.name), translations.deleteConfirm);
                      if (confirm) {
                        showLoadingDialog(context, (_) => Text(translations.deleting), () => store.deleteDevice(device.id));
                      }
                    } else if (action == _DeviceAction.rename) {
                      Provider.of<ValueNotifier<_DeviceState>>(context, listen: false).value = _DeviceState.edition;
                    }
                  },
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: kNormalPadding),
                            child: Icon(Icons.edit, semanticLabel: translations.rename),
                          ),
                          Expanded(child: Text(translations.rename)),
                        ],
                      ),
                      value: _DeviceAction.rename,
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: kNormalPadding),
                            child: Icon(Icons.delete, semanticLabel: translations.delete),
                          ),
                          Expanded(child: Text(translations.delete)),
                        ],
                      ),
                      value: _DeviceAction.delete,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(height: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(kSmallPadding),
              child: RemoteWidget(
                associatedData: device,
                definition: device.template?.toMap()?.map((key, value) {
                  return MapEntry(key, toPrimitive(value));
                }),
                data: device.data?.toMap()?.map((key, value) {
                  return MapEntry(key, toPrimitive(value));
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

dynamic toPrimitive(JsonObject value) {
  var val;
  if (value is StringJsonObject) {
    val = value.asString;
  } else if (value is NumJsonObject) {
    val = value.asNum;
  } else if (value is MapJsonObject) {
    val = value.asMap;
  } else if (value is BoolJsonObject) {
    val = value.asBool;
  } else if (value is ListJsonObject) {
    val = value.asList;
  }
  return val;
}

class _DeviceEdition extends HookWidget {
  final Device device;

  const _DeviceEdition({Key key, this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final controller = useTextEditingController(text: device.name);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: kSmallPadding),
                  child: TextField(
                    controller: controller,
                  ),
                ),
              ),
              IconButton(
                tooltip: translations.cancel,
                icon: Icon(
                  Icons.cancel,
                  semanticLabel: translations.cancel,
                ),
                onPressed: () {
                  Provider.of<ValueNotifier<_DeviceState>>(context, listen: false).value = _DeviceState.idle;
                },
              ),
            ],
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(kNormalPadding),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: HookBuilder(
                  builder: (context) {
                    final selectedRoom = useState(device.roomId);
                    return Column(
                      children: <Widget>[
                        RoomSelector(
                          isExpanded: true,
                          selected: selectedRoom.value,
                          onRoomSelected: (room) {
                            selectedRoom.value = room.id;
                          },
                        ),
                        ElevatedButton(
                          //textColor: Colors.white,
                          onPressed: () {
                            Provider.of<DeviceStore>(context, listen: false).saveDevice(device, name: controller.text, roomId: selectedRoom.value);
                          },
                          child: Text(translations.save),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum _DeviceAction {
  rename,
  delete,
}

enum _DeviceState {
  idle,
  edition,
}
