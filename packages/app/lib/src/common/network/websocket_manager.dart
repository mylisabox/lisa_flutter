
import 'dart:async';
import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:lisa_flutter/src/common/utils/base_url_provider.dart';
import 'package:lisa_flutter/src/common/utils/disposable.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:logging/logging.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final _logger = Logger('Websockets');

class WebsocketMessage {
  final String type;
  final dynamic data;

  WebsocketMessage(this.type, this.data);

  factory WebsocketMessage.fromJSON(Map json) {
    String type = json['type']!;
    dynamic data = json['message'];
    switch(type) {
      case 'device_added':
      case 'device_updated':
        try {
          data = standardSerializers.deserialize(data, specifiedType: FullType(Device));
        } catch(ex, stack){
          _logger.severe('Can\'t deserialize websocket data $ex' , ex, stack);
          rethrow;
        }
      break;
    }
    return WebsocketMessage(type, data);
  }

  @override
  String toString() {
    return 'WebsocketMessage{type: $type, data: $data}';
  }
}

class WebsocketManager with BaseUrlProvider, Disposable {
  final StreamController<WebsocketMessage> _controller = StreamController.broadcast();
  WebSocketChannel? _channel;

  Stream<WebsocketMessage> get onMessage => _controller.stream;

  StreamSubscription? _subscription;

  WebsocketManager();

  void setup(String token) async {
    await _subscription?.cancel();
    _channel?.sink.close();
    _channel = WebSocketChannel.connect(Uri.parse('$baseWebsocketUrl?token=$token'));
    _logger.info('websocket connected to $baseWebsocketUrl');
    _subscription = _channel!.stream.listen((message) {
      final json = jsonDecode(message);
      if (json['type'] == 'Unauthorized') {
        _logger.severe('websocket unauthorized');
      } else {
        final data = WebsocketMessage.fromJSON(json);
        _controller.add(data);
      }
    }, onError: (err) {
      print(err);
    }, onDone: () {
      _logger.warning('websocket closed, reconnecting');
      setup(token);
    });

  }

  @override
  void dispose() {
    _channel?.sink.close();
    _subscription?.cancel();
    _controller.close();
  }
}
