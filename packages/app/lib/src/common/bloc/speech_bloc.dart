import 'package:lisa_flutter/src/common/network/api_provider.dart';
import 'package:lisa_server_sdk/api/chatbot_api.dart';
import 'package:lisa_server_sdk/model/interact_request.dart';
import 'package:mobx/mobx.dart';

part 'speech_bloc.g.dart';

class SpeechBloc = _SpeechBloc with _$SpeechBloc;

abstract class _SpeechBloc with Store {
  final ChatbotApi _api;

  _SpeechBloc({ChatbotApi api}) : _api = api ?? BackendApiProvider().api.getChatbotApi();

  @action
  Future<String> sendSentence(String sentence, String lang) async {
    final result = await _api.interact(InteractRequest(sentence: sentence, lang: lang));
    return result.response;
  }
}
