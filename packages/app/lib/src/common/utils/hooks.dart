import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

dynamic useDisposable(dynamic Function() valueBuilder, [List<Object> keys = const <dynamic>[]]) {
  final disposable = useMemoized(valueBuilder, keys);
  useEffect(() => disposable.dispose, [disposable]);
  return disposable;
}
