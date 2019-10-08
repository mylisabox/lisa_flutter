import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/presentation/speech_button.dart';
import 'package:lisa_flutter/src/common/stores/speech_store.dart';
import 'package:lisa_flutter/src/common/utils/platform_detector/platform_detector.dart';
import 'package:lisa_flutter/src/devices/presentation/add_device.dart';
import 'package:lisa_flutter/src/devices/presentation/dashboard.dart';
import 'package:lisa_flutter/src/devices/stores/device_store.dart';
import 'package:lisa_server_sdk/model/room.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class RoomDashboard extends HookWidget {
  static const route = '/room';
  final Room room;

  const RoomDashboard({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = useMemoized(() => DeviceStore());

    useEffect(() {
      store.loadDevices(roomId: room.id).catchError((err, stack) {
        showErrorDialog(context, err, stack);
      });
      return null;
    }, [store]);

    return Provider.value(
      value: store,
      child: RoomContainer(
        room: room,
        child: Dashboard(
          roomId: room.id,
        ),
      ),
    );
  }
}

class RoomContainer extends HookWidget {
  final Widget child;
  final Room room;

  const RoomContainer({Key key, this.child, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = useMemoized(() => SpeechStore());
    return Scaffold(
      primary: false,
      floatingActionButton: kIsMobile()
          ? SpeechButton(
              onResults: (text) async {
                final response = await store.sendSentence(text, Localizations.localeOf(context).languageCode);
                Toast.show(response, context, duration: Toast.LENGTH_LONG);
              },
            )
          : AddDeviceFloatingButton(room: room),
      body: Container(
        padding: EdgeInsets.all(kSmallPadding),
        child: child,
      ),
    );
  }
}
