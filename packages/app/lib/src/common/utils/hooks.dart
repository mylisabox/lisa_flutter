import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

TextEditingController useTextEditingController({text}) {
  final controller = useMemoized(() => TextEditingController(text: text ?? ''));
  useEffect(() {
    controller.text = text;
    return null;
  }, [text]);
  useEffect(() => controller.dispose, [controller]);
  return controller;
}

dynamic useDisposable(dynamic Function() valueBuilder, [List<Object> keys = const <dynamic>[]]) {
  final disposable = useMemoized(valueBuilder, keys);
  useEffect(() => disposable.dispose, [disposable]);
  return disposable;
}
