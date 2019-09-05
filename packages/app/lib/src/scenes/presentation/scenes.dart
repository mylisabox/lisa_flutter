import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScenesWidget extends HookWidget {
  static const route = '/scenes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: Placeholder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
