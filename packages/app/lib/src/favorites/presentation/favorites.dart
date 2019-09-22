import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/devices/presentation/dashboard.dart';
import 'package:lisa_flutter/src/devices/stores/device_store.dart';
import 'package:lisa_flutter/src/rooms/presentation/room_dashboard.dart';
import 'package:provider/provider.dart';

class FavoritesWidget extends HookWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    final store = useMemoized(() => DeviceStore());

    useEffect(() {
      store.loadDevices(roomId: null).catchError((err, stack) {
        showErrorDialog(context, err, stack);
      });
      return null;
    }, [store]);

    return Provider.value(
      value: store,
      child: RoomContainer(
        child: Dashboard(),
      ),
    );
  }
}
