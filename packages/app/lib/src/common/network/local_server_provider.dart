import 'package:lisa_flutter/src/common/network/local_server_provider_base.dart';

abstract class LocalServerProvider {
  static create() {
    return createProvider();
  }

  LocalServerProvider();

  Future<String> search();
}
