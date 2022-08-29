import 'package:flutter/material.dart';
import 'package:lisa_flutter/src/common/errors.dart';

class RefreshIndicatorContentError extends StatelessWidget {
  final dynamic error;

  const RefreshIndicatorContentError({Key? key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late ErrorResult errorToShow;
    if (error is ErrorResultException) {
      errorToShow = error.cause;
    } else if (error is ErrorResult) {
      errorToShow = error;
    } else {
      errorToShow = handleError(error, null).cause;
    }

    return RefreshIndicatorContent(
      child: Center(
        child: Text(
          errorToShow.twoLiner(context),
          style: TextStyle(color: Theme.of(context).errorColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class RefreshIndicatorContent extends StatelessWidget {
  final Widget child;

  const RefreshIndicatorContent({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          SizedBox(
            child: child,
            height: constraint.maxHeight,
          ),
        ],
      ),
    );
  }
}
