import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'interact_response.jser.dart';

class InteractResponse {
  @Alias('action')
  final String action;

  @Alias('lang')
  final String lang;

  @Alias('userId')
  final String userId;

  @Alias('userSentence')
  final String userSentence;

  @Alias('response')
  final String response;

  @Alias('responses')
  final List<String> responses;

  InteractResponse({this.action = null, this.lang = null, this.userId = null, this.userSentence = null, this.response = null, this.responses = const []});

  @override
  String toString() {
    return 'InteractResponse[action=$action, lang=$lang, userId=$userId, userSentence=$userSentence, response=$response, responses=$responses, ]';
  }
}

@GenSerializer(nullableFields: false)
class InteractResponseSerializer extends Serializer<InteractResponse> with _$InteractResponseSerializer {}
