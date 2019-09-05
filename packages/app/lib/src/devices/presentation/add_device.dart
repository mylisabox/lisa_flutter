import 'package:flutter/material.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_server_sdk/model/room.dart';
import 'package:proxy_layout/proxy_layout.dart';

class AddDeviceScreen extends StatelessWidget {
  static const route = '/addDevice';
  final Room room;

  AddDeviceScreen({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddDeviceWidget();
  }
}

class AddDeviceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

class AddDeviceDialog extends StatelessWidget {
  final Room room;

  const AddDeviceDialog({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    return getAppDialog(
      context,
      (_) => Text(room == null ? translations.addDevice : translations.addDeviceTo(room.name)),
      (_) => Container(
        width: 600,
        height: 400,
        child: AddDeviceWidget(),
      ),
      forceAndroid: true,
    );
  }
}

class AddDeviceFloatingButton extends StatelessWidget {
  final Room room;

  const AddDeviceFloatingButton({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (DeviceProxy.isTablet(context)) {
          showPlatformDialog(context, (_) => AddDeviceDialog(room: room));
        } else {
          Navigator.of(context, rootNavigator: true).pushNamed(AddDeviceScreen.route, arguments: room);
        }
      },
      child: Icon(Icons.add),
    );
  }
}
