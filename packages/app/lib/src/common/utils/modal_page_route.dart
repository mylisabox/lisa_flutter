import 'package:flutter/material.dart';

class ModalPageRoute<T> extends PageRoute<T> with MaterialRouteTransitionMixin<T> {
  final WidgetBuilder builder;
  @override
  final bool barrierDismissible;

  ModalPageRoute({
    required this.builder,
    this.barrierDismissible = false,
    RouteSettings? settings,
  }) : super(
          settings: settings,
          fullscreenDialog: true,
        );

  @override
  Color? get barrierColor => Colors.black.withOpacity(0.5);

  @override
  bool get maintainState => false;

  @override
  bool get opaque => false;

  @override
  Widget buildContent(BuildContext context) {
    return builder(context);
  }
}
