import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/rooms/presentation/room_dashboard.dart';

class OrphansWidget extends HookWidget {
  static const route = '/orphans';
  @override
  Widget build(BuildContext context) {
    return RoomContainer(
      child: Placeholder(
        color: Colors.blueAccent,
      ),
    );
  }
}
