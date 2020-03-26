import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum ProgressButtonState { idle, progress, done }

class ProgressButton extends HookWidget {
  final EdgeInsets padding;
  final Color color;
  final Widget child;
  final double elevation;
  final ProgressButtonState state;
  final VoidCallback onTap;
  final Future Function() until;
  final Function(dynamic, dynamic) onError;
  final Function(dynamic) onSuccess;

  ProgressButton.withFuture(
      {Key key, this.padding, this.color, this.child, this.elevation, @required this.until, @required this.onError, @required this.onSuccess})
      : state = null,
        onTap = null,
        super(key: key);

  ProgressButton.withState({Key key, this.padding, this.color, this.child, this.elevation, @required this.onTap, @required this.state})
      : until = null,
        onError = null,
        onSuccess = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _globalKey = useMemoized(() => GlobalKey());
    final _width = useState(double.infinity);
    final _isPressed = useState(false);
    final _state = useState(state ?? ProgressButtonState.idle);
    final _controller = useAnimationController(duration: Duration(milliseconds: 500));
    final isFinish = useState<bool>(false);
    final _anim = useAnimation(Tween(begin: 0.0, end: 1.0).animate(_controller));
    final initialWidth = useState<double>(null);
    final height = useState<double>(null);
    final result = useState<dynamic>(null);

    final _onStart = (bool fromTap) async {
      if (_state.value == ProgressButtonState.idle || initialWidth.value == null) {
        initialWidth.value = _globalKey.currentContext.size.width;
        height.value = _globalKey.currentContext.size.height;
      }

      _isPressed.value = true;

      if (until == null) {
        if (fromTap) {
          onTap();
        }
      } else {
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
      }
    };

    useEffect(() {
      if (state != null && _state.value != state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _onStart(false);
          if (state == ProgressButtonState.idle) {
            _controller.reverse();
            reset(_state, _width, _isPressed, initialWidth);
          } else if (state == ProgressButtonState.progress) {
            _controller.forward();
          } else {
            isFinish.value = true;
          }
          _state.value = state;
        });
      }
      return null;
    }, [state]);

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
                _onStart(true);
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
