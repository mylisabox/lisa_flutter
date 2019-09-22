import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/utils/base_url_provider.dart';
import 'package:lisa_flutter/src/devices/stores/add_device_store.dart';
import 'package:lisa_flutter/src/devices/stores/device_store.dart';
import 'package:lisa_server_sdk/model/device_settings.dart';
import 'package:lisa_server_sdk/model/room.dart';
import 'package:provider/provider.dart';
import 'package:proxy_layout/proxy_layout.dart';

part 'add_device_search.dart';
part 'add_device_steps.dart';

class AddDeviceScreen extends StatelessWidget {
  static const route = '/addDevice';
  final Room room;

  AddDeviceScreen({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    return Provider(
      builder: (_) {
        return AddDeviceStore(room: room);
      },
      dispose: (_, store) => store.dispose(),
      child: Builder(
        builder: (context) {
          final store = Provider.of<AddDeviceStore>(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(room == null ? translations.addDevice : translations.addDeviceTo(room.name)),
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(kNormalPadding),
                    child: AddDeviceWidget(),
                  ),
                ),
                if (store.selectedDeviceTemplate != null) Divider(height: 1),
                if (store.selectedDeviceTemplate != null)
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            if (store.back()) {
                              Navigator.of(context).pop(false);
                            }
                          },
                          child: Text(translations.cancel)),
                      Observer(
                        builder: (_) => FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            onPressed: store.canContinue && !store.isLoading
                                ? () async {
                                    if (await store.next()) {
                                      Navigator.of(context).pop(true);
                                    }
                                  }
                                : null,
                            child: Text(translations.continueButton)),
                      )
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AddDeviceWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AddDeviceStore>(context);
    final translations = CommonLocalizations.of(context);

    return Observer(builder: (context) {
      if (store.selectedDeviceTemplate == null || store.currentCustomStep == null || store.currentCustomStep.isEmpty) {
        return AddDeviceSearch();
      }

      if (store.isLoading) {
        return Center(child: CircularProgressIndicator());
      }

      if (store.currentCustomStep['step'].contains('list')) {
        return AddDeviceListStep();
      } else if (store.currentCustomStep['step'].contains('settings')) {
        return AddDeviceSettingsStep();
      } else if (store.currentCustomStep['step'].contains('image')) {
        return AddDeviceImageStep();
      }

      return Placeholder();
    });
  }
}

class AddDeviceDialog extends StatelessWidget {
  final Room room;

  const AddDeviceDialog({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    return Provider(
      builder: (_) {
        return AddDeviceStore(room: room);
      },
      dispose: (_, store) => store.dispose(),
      child: Observer(
        builder: (context) {
          final store = Provider.of<AddDeviceStore>(context);
          return getAppDialog(
            context,
            (_) => Text(room == null ? translations.addDevice : translations.addDeviceTo(room.name)),
            (_) => Container(
              width: 600,
              height: 500,
              child: AddDeviceWidget(),
            ),
            forceAndroid: true,
            actions: [
              DialogAction(
                text: translations.cancel,
                callback: (context) {
                  if (store.back()) {
                    Navigator.of(context).pop(false);
                  }
                },
              ),
              DialogAction(
                text: translations.continueButton,
                isDefaultAction: true,
                callback: store.canContinue && !store.isLoading
                    ? (context) async {
                        final store = Provider.of<AddDeviceStore>(context, listen: false);
                        final isFinish = await store.next();
                        if (isFinish) {
                          Navigator.of(context).pop(true);
                        }
                      }
                    : null,
              ),
            ],
          );
        },
      ),
    );
  }
}

class AddDeviceFloatingButton extends StatelessWidget {
  final Room room;

  const AddDeviceFloatingButton({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        var needRefresh = false;
        if (DeviceProxy.isTablet(context)) {
          needRefresh = await showPlatformDialog(context, (_) => AddDeviceDialog(room: room), barrierDismissible: false) ?? false;
          if (needRefresh) {
            Provider.of<DeviceStore>(context).loadDevices();
          }
        } else {
          needRefresh = await Navigator.of(context, rootNavigator: true).pushNamed(AddDeviceScreen.route, arguments: room) ?? false;
        }
        if (needRefresh) {
          Provider.of<DeviceStore>(context).loadDevices();
        }
      },
      child: Icon(Icons.add),
    );
  }
}
