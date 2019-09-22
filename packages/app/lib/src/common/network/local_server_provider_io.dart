import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:lisa_flutter/src/common/network/local_server_provider.dart';
import 'package:logging/logging.dart';
import 'package:multicast_lock/multicast_lock.dart';

LocalServerProvider createProvider() => LocalServerProviderIO();

/// LocalServerProvider is searching for local L.I.S.A. server on the network
class LocalServerProviderIO extends LocalServerProvider {
  final _log = Logger('LocalServerProvider');

  Future<String> search() async {
    if (kIsWeb) {
      return Future.value('http://localhost:3000');
    }

    MulticastLock multicastLock;
    if (defaultTargetPlatform == TargetPlatform.android) {
      multicastLock = MulticastLock();
      await multicastLock.acquire();
    }

    final completer = Completer<String>();
    const searchQuery = 'lisa-server-search';
    const wantedResponse = 'lisa-server-response';
    const codec = Utf8Codec();
    final dataToSend = codec.encode(searchQuery);
    final address = InternetAddress('239.9.9.9');

    final udpSocket =
        await RawDatagramSocket.bind(InternetAddress.anyIPv4, 5544, reuseAddress: true, reusePort: defaultTargetPlatform != TargetPlatform.android);
    try {
      udpSocket.joinMulticast(address);
    } catch (err, stacktrace) {
      _log.severe('Can\'t joinMulticast on $address', err, stacktrace);
      return Future.error(err);
    }
    final subscription = udpSocket.listen(
      (e) {
        Datagram dg = udpSocket.receive();
        if (dg == null) return;

        String message = new String.fromCharCodes(dg.data);
        _log.info('receive multicast message $message');
        if (message.startsWith(wantedResponse)) {
          final data = message.replaceFirst(wantedResponse, '').trim();
          final json = jsonDecode(data);

          final url = '${json['isSecure'] ? 'https' : 'http'}://${dg.address.address}:${json['port']}/';
          completer.complete(url);
        }
      },
      cancelOnError: true,
      onError: (err, stack) {
        _log.severe('Can\'t joinMulticast on $address', err, stack);
        completer.completeError(err);
      },
    );
    udpSocket.send(dataToSend, address, 5544);

    //Return null if nothing is found before the timeout
    return completer.future.timeout(Duration(milliseconds: 600)).catchError((error) {
      _log.severe('Can\'t find server on multicast $error', error);
    }, test: (err) => err is TimeoutException).whenComplete(
      () {
        subscription.cancel();
        if (defaultTargetPlatform == TargetPlatform.android) {
          multicastLock.release();
        }
      },
    );
  }
}