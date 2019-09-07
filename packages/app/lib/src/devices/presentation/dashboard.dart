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
import 'package:lisa_flutter/src/devices/stores/device_store.dart';
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
  final List<Device> devices;
  final int roomId;

  const Dashboard({Key key, this.devices, this.roomId})
      : assert(!(devices != null && roomId != null), 'Can\'t have both roomId and device list'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final store = useMemoized(() => DeviceStore());
    final callback = useMemoized(
      () => (String key, value, {associatedData}) => store.deviceChange(key, value, associatedData: associatedData).catchError(
            (err, stack) {
              showErrorDialog(context, err, stack);
            },
          ),
    );

    useEffect(() {
      store.loadDevices(roomId: roomId, devices: devices).catchError((err, stack) {
        showErrorDialog(context, err, stack);
      });
      return null;
    }, [store, roomId]);

    return Provider.value(
      value: store,
      child: RemoteManagerWidget(
        parsers: [
          RemoteColorPickerFactory(),
          RemoteIpCameraFactory(),
          RemoteImageButtonFactory(baseUrlProvider: () {
            final HostInterceptor interceptor = BackendApiProvider().interceptors.first; //get host interceptor
            return interceptor.host;
          })
        ],
        onChanges: callback,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return RefreshIndicator(
              onRefresh: () {
                return store.loadDevices(roomId: roomId, devices: devices);
              },
              child: Observer(
                builder: (context) {
                  if (store.error != null) {
                    return RefreshIndicatorContent(
                      child: Center(
                        child: Text(
                          store.error.cause.twoLiner(context),
                          style: TextStyle(color: Theme.of(context).errorColor),
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
                        final int width = device?.template['widgetWidth'] ?? 1;
                        final int height = device?.template['widgetHeight'] ?? 1;
                        return StaggeredTile.count(width * _widgetWidthUnit, height * _widgetHeightUnit);
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
      ),
    );
  }
}

class _DashboardWidget extends StatelessWidget {
  final Device device;

  const _DashboardWidget({Key key, this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(kSmallPadding),
                child: Text(device.name),
              ),
              Spacer(),
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
                    final store = Provider.of<DeviceStore>(context);
                    store.toggleFavorite(device.id, device.favorite).catchError((err, stack) {
                      showErrorDialog(context, err, stack);
                    });
                  },
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
                definition: device.template,
                data: device.data,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
