import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:android_multicast_lock/android_multicast_lock.dart';
import 'package:flutter/foundation.dart';
import 'package:lisa_flutter/src/common/network/local_server_provider.dart';
import 'package:logging/logging.dart';

LocalServerProvider createProvider() => LocalServerProviderIO();

/// LocalServerProvider is searching for local L.I.S.A. server on the network
class LocalServerProviderIO extends LocalServerProvider {
  final _log = Logger('LocalServerProvider');

  Future<String> search() async {
    MulticastLock multicastLock = MulticastLock();
    await multicastLock.acquire();

    final completer = Completer<String>();
    const searchQuery = 'lisa-server-search';
    const wantedResponse = 'lisa-server-response';
    const codec = Utf8Codec();
    final dataToSend = codec.encode(searchQuery);
    final address = InternetAddress('238.9.9.9');

    final udpSocket =
        await RawDatagramSocket.bind(InternetAddress.anyIPv4, 5544, reuseAddress: true, reusePort: defaultTargetPlatform != TargetPlatform.android);
    try {
      var activeInterface;
      List<NetworkInterface> interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
      );
      for (var interface in interfaces) {
        if (interface.addresses.isNotEmpty && (interface.name == 'en0' || interface.name == 'wlan0')) {
          activeInterface = interface;
        }
      }
      udpSocket.setRawOption(RawSocketOption.fromInt(RawSocketOption.levelIPv4, RawSocketOption.IPv4MulticastInterface, 0));

      if (defaultTargetPlatform == TargetPlatform.android) {
        udpSocket.joinMulticast(address, activeInterface);
      } else {
        // fix joining multicast on iOS, see https://github.com/dart-lang/sdk/issues/42250#issuecomment-759026385
        final value = Uint8List.fromList(address.rawAddress + activeInterface.addresses[0].rawAddress);
        udpSocket.setRawOption(RawSocketOption(RawSocketOption.levelIPv4, 12, value));
      }
      //udpSocket.joinMulticast(address, interfaceEn0);
    } catch (err, stacktrace) {
      _log.severe('Can\'t joinMulticast on $address', err, stacktrace);
      return Future.error(err);
    }
    final subscription = udpSocket.listen(
      (e) {
        final dg = udpSocket.receive();
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
    return completer.future.timeout(Duration(milliseconds: 5000)).catchError((error) {
      _log.severe('Can\'t find server on multicast $error', error);
    }, test: (err) => err is TimeoutException).whenComplete(
      () {
        subscription.cancel();
        multicastLock.release();
      },
    );
  }
}
