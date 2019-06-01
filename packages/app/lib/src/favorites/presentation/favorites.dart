import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/devices/presentation/dashboard.dart';

class FavoritesWidget extends HookWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kSmallPadding),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Dashboard(),
    );
  }
}
