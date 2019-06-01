import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum ProgressButtonState { idle, progress, done }

class ProgressButton extends HookWidget {
  final EdgeInsets padding;
  final Color color;
  final Widget child;
  final double elevation;
  final Future Function() until;
  final Function(dynamic, dynamic) onError;
  final Function(dynamic) onSuccess;

  ProgressButton({Key key, this.padding, this.color, this.child, this.elevation, this.until, this.onError, this.onSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _globalKey = useMemoized(() => GlobalKey());
    final _width = useState(double.infinity);
    final _isPressed = useState(false);
    final _state = useState(ProgressButtonState.idle);
    final _controller = useAnimationController(duration: Duration(milliseconds: 500));
    final _anim = useAnimation(Tween(begin: 0.0, end: 1.0).animate(_controller));
    final initialWidth = useState<double>(null);
    final height = useState<double>(null);
    final isFinish = useState<bool>(false);
    final result = useState<dynamic>(null);

    useEffect(() {
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed && isFinish.value) {
          WidgetsBinding.instance.addPostFrameCallback((duration) {
            onSuccess(result.value);
          });
        }
      });
      return () {
        reset(_state, _width, _isPressed, initialWidth);
      };
    }, [this]);

    return Container(
      key: _globalKey,
      width: initialWidth.value == null ? double.infinity : initialWidth.value - ((initialWidth.value - height.value) * _anim),
      height: _isPressed.value ? 55 : null,
      child: RaisedButton(
        shape: _isPressed.value ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)) : null,
        padding: _isPressed.value ? EdgeInsets.zero : padding,
        color: color,
        disabledColor: _state.value == ProgressButtonState.done ? Theme.of(context).accentColor : color,
        child: buildButtonChild(_state),
        onPressed: _isPressed.value
            ? null
            : () async {
                initialWidth.value = _globalKey.currentContext.size.width;
                height.value = _globalKey.currentContext.size.height;

                _isPressed.value = true;
                if (_state.value == ProgressButtonState.idle) {
                  _controller.forward();
                  _state.value = ProgressButtonState.progress;
                }
                try {
                  result.value = await until();
                  _state.value = ProgressButtonState.done;
                  isFinish.value = true;
                  if (_controller.isCompleted) {
                    onSuccess(result);
                  }
                } catch (err, stacktrace) {
                  onError(err, stacktrace);
                  _controller.reverse();
                  reset(_state, _width, _isPressed, initialWidth);
                }
              },
      ),
    );
  }

  Widget buildButtonChild(ValueNotifier<ProgressButtonState> state) {
    if (state.value == ProgressButtonState.idle) {
      return child;
    } else if (state.value == ProgressButtonState.progress) {
      return CircularProgressIndicator(
        value: null,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void reset(
    ValueNotifier<ProgressButtonState> state,
    ValueNotifier<double> width,
    ValueNotifier<bool> isPressed,
    ValueNotifier<double> initialWidth,
  ) {
    isPressed.value = false;
    width.value = double.infinity;
    state.value = ProgressButtonState.idle;
    initialWidth.value = null;
  }
}
