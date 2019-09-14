import 'package:flutter/material.dart';

class FadePageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;
  final RouteSettings settings;

  FadePageRoute({this.builder, this.settings})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return builder(context);
          },
          transitionsBuilder: (context, anim1, anim2, child) {
            return FadeTransition(
              child: child,
              opacity: Tween<double>(
                begin: 0,
                end: 1,
              ).animate(anim1),
            );
          },
          settings: settings,
        );
}

class FromBottomPageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;
  final RouteSettings settings;

  FromBottomPageRoute({this.builder, this.settings})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return builder(context);
          },
          transitionsBuilder: (context, anim1, anim2, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(anim1),
              child: FadeTransition(
                child: child,
                opacity: Tween<double>(
                  begin: 0,
                  end: 1,
                ).animate(anim1),
              ),
            );
          },
          opaque: false,
          settings: settings,
        );
}
