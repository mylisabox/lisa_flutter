import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_server_sdk/api/chatbot_api.dart';
import 'package:lisa_server_sdk/model/interact_request.dart';
import 'package:mobx/mobx.dart';

part 'speech_store.g.dart';

class SpeechStore = _SpeechStore with _$SpeechStore;

abstract class _SpeechStore with Store {
  final ChatbotApi _api;

  _SpeechStore({ChatbotApi api}) : _api = api ?? BackendApiProvider().api.getChatbotApi();

  @action
  Future<String> sendSentence(String sentence, String lang, String roomId) async {
    final result = await _api.interact((InteractRequestBuilder()..sentence= sentence..lang= lang..context= MapBuilder<String, JsonObject>({'roomId': JsonObject(roomId)})).build());
    return result.data.response;
  }
}
