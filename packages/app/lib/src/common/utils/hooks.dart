import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobx/mobx.dart';

dynamic useDisposable(dynamic Function() valueBuilder, [List<Object> keys = const <dynamic>[]]) {
  final disposable = useMemoized(valueBuilder, keys);
  useEffect(() => disposable.dispose, [disposable]);
  return disposable;
}

typedef ReactionSetup<T> = T Function(Reaction);

void useReaction<T>(ReactionSetup<T> fn, Function(T) effect, {bool triggerOnce = false}) {
  final disposer = useMemoized(() => reaction(fn, effect, delay: 500), const []);
  useEffect(() {
    if (triggerOnce) {
      effect(fn(disposer.reaction));
    }
    return disposer;
  }, [disposer]);
}
