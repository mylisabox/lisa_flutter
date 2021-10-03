
import 'dart:async';

abstract class Disposable {
  final List<StreamSubscription> subscriptions = [];

  void dispose();
}
