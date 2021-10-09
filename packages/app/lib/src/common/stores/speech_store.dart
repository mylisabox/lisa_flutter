import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_server_sdk/lisa_server_sdk.dart';
import 'package:mobx/mobx.dart';

part 'speech_store.g.dart';

class SpeechStore = _SpeechStore with _$SpeechStore;

abstract class _SpeechStore with Store {
  final ChatbotApi _api;

  _SpeechStore({ChatbotApi? api}) : _api = api ?? BackendApiProvider().api.getChatbotApi();

  @action
  Future<String> sendSentence(String sentence, String lang) async {
    final result = await _api.interact(interactRequest: (InteractRequestBuilder()..sentence= sentence..lang= lang).build());
    return result.data!.response;
  }
}
