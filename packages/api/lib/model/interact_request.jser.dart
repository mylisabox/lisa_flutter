// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interact_request.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$InteractRequestSerializer
    implements Serializer<InteractRequest> {
  @override
  Map<String, dynamic> toMap(InteractRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'sentence', model.sentence);
    setMapValueIfNotNull(ret, 'lang', model.lang);
    return ret;
  }

  @override
  InteractRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = new InteractRequest(
        sentence: map['sentence'] as String ?? getJserDefault('sentence'),
        lang: map['lang'] as String ?? getJserDefault('lang'));
    return obj;
  }
}
