import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/devices/presentation/dashboard.dart';
import 'package:lisa_flutter/src/rooms/presentation/room_dashboard.dart';

class FavoritesWidget extends HookWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return RoomContainer(
      child: Dashboard(),
    );
  }
}
