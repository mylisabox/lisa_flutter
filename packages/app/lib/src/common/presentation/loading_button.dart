
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

  const ProgressButton({
    required this.padding,
    required this.color,
    required this.child,
    required this.elevation,
    required this.state,
    required this.onTap,
    Key? key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final _globalKey = useMemoized(() => GlobalKey());
    final _width = useState(double.infinity);
    final _state = useState(state);
    final _controller = useAnimationController(duration: const Duration(milliseconds: 500));
    final isFinish = useState<bool>(false);
    final _anim = useAnimation(Tween(begin: 0.0, end: 1.0).animate(_controller));
    final initialWidth = useState<double?>(null);
    final height = useState<double?>(null);

    void _onStart(bool fromTap) async {
      if (_state.value == ProgressButtonState.idle || initialWidth.value == null) {
        initialWidth.value = _globalKey.currentContext!.size!.width;
        height.value = _globalKey.currentContext!.size!.height;
      }
    }

    useEffect(() {
      if (_state.value != state) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          _onStart(false);
          if (state == ProgressButtonState.idle) {
            _controller.reverse();
            reset(_state, _width, initialWidth);
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

    final _isPressed = state != ProgressButtonState.idle;

    return SizedBox(
      key: _globalKey,
      width: initialWidth.value == null ? double.infinity : initialWidth.value! - ((initialWidth.value! - height.value!) * _anim),
      height: _isPressed ? 55 : null,
      // ignore: deprecated_member_use
      child: RaisedButton(
        shape: _isPressed ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)) : null,
        padding: _isPressed ? EdgeInsets.zero : padding,
        color: color,
        disabledColor: _state.value == ProgressButtonState.done ? Theme.of(context).primaryColor : color,
        child: buildButtonChild(_state),
        onPressed: _isPressed
            ? null
            : onTap,
      ),
    );
  }

  Widget buildButtonChild(ValueNotifier<ProgressButtonState> state) {
    if (state.value == ProgressButtonState.idle) {
      return child;
    } else if (state.value == ProgressButtonState.progress) {
      return const CircularProgressIndicator(
        value: null,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      );
    } else {
      return const Icon(Icons.check, color: Colors.white);
    }
  }

  void reset(
    ValueNotifier<ProgressButtonState> state,
    ValueNotifier<double> width,
    ValueNotifier<double?> initialWidth,
  ) {
    width.value = double.infinity;
    state.value = ProgressButtonState.idle;
    initialWidth.value = null;
  }
}
