// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interact_response.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$InteractResponseSerializer
    implements Serializer<InteractResponse> {
  @override
  Map<String, dynamic> toMap(InteractResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'action', model.action);
    setMapValueIfNotNull(ret, 'lang', model.lang);
    setMapValueIfNotNull(ret, 'userId', model.userId);
    setMapValueIfNotNull(ret, 'userSentence', model.userSentence);
    setMapValueIfNotNull(ret, 'response', model.response);
    setMapValueIfNotNull(ret, 'responses',
        codeNonNullIterable(model.responses, (val) => val as String, []));
    return ret;
  }

  @override
  InteractResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = InteractResponse(
        action: map['action'] as String ?? getJserDefault('action'),
        lang: map['lang'] as String ?? getJserDefault('lang'),
        userId: map['userId'] as int ?? getJserDefault('userId'),
        userSentence:
            map['userSentence'] as String ?? getJserDefault('userSentence'),
        response: map['response'] as String ?? getJserDefault('response'),
        responses: codeNonNullIterable<String>(map['responses'] as Iterable,
                (val) => val as String, <String>[]) ??
            getJserDefault('responses'));
    return obj;
  }
}
