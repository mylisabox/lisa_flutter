import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/utils/platform_detector/platform_detector.dart';
import 'package:lisa_flutter/src/devices/presentation/add_device.dart';
import 'package:lisa_flutter/src/devices/presentation/dashboard.dart';
import 'package:lisa_server_sdk/model/room.dart';

class RoomDashboard extends HookWidget {
  static const route = '/room';
  final Room room;

  const RoomDashboard({Key key, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoomContainer(
      room: room,
      child: Dashboard(
        roomId: room.id,
      ),
    );
  }
}

class RoomContainer extends StatelessWidget {
  final Widget child;
  final Room room;

  const RoomContainer({Key key, this.child, this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      floatingActionButton: kIsMobile() ? null : AddDeviceFloatingButton(room: room),
      body: Container(
        padding: EdgeInsets.all(kSmallPadding),
        child: child,
      ),
    );
  }
}
