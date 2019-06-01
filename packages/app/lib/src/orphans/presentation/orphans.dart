import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OrphansWidget extends HookWidget {
  static const route = '/orphans';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Placeholder(
        color: Colors.blueAccent,
      ),
    );
  }
}
