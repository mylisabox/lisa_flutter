import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

TextEditingController useTextEditingController({text}) {
  final controller = useMemoized(() => TextEditingController(text: text ?? ''));
  useEffect(() => controller.dispose, [controller]);
  return controller;
}

dynamic useDisposable(dynamic Function() valueBuilder) {
  final disposable = useMemoized(valueBuilder);
  useEffect(() => disposable.dispose, [disposable]);
  return disposable;
}
