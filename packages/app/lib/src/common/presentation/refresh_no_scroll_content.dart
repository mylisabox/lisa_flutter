import 'package:flutter/material.dart';

class RefreshIndicatorContent extends StatelessWidget {
  final Widget child;

  const RefreshIndicatorContent({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            child: child,
            height: constraint.maxHeight,
          ),
        ],
      ),
    );
  }
}
