import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/network/local_server_provider.dart';

LocalServerProvider createProvider() => LocalServerProviderWeb();

/// LocalServerProvider is searching for local L.I.S.A. server on the network
class LocalServerProviderWeb extends LocalServerProvider {
  @override
  Future<String> search() async {
    if (!kIsProductionMode) {
      //for debug let's use local lisa instance
      //return Future.value('http://192.168.1.41');
    }
    return Future.value(window.location.protocol + '//' + window.location.hostname! + ':' + _getPort());
  }

  String _getPort() {
    final defaultPort = window.location.protocol.contains('https') ? "443" : "80";
    if ((int.tryParse(window.location.port) ?? 0) > 30000) {
      return '3000'; // Dev mode
    }
    return window.location.port.isEmpty ? defaultPort : window.location.port;
  }
}
