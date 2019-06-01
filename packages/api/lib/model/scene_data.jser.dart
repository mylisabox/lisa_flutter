// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scene_data.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$SceneDataSerializer implements Serializer<SceneData> {
  @override
  Map<String, dynamic> toMap(SceneData model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'sentences',
        codeNonNullIterable(model.sentences, (val) => val as String, []));
    setMapValueIfNotNull(ret, 'responses',
        codeNonNullIterable(model.responses, (val) => val as String, []));
    setMapValueIfNotNull(ret, 'commands',
        codeNonNullIterable(model.commands, (val) => val as String, []));
    return ret;
  }

  @override
  SceneData fromMap(Map map) {
    if (map == null) return null;
    final obj = new SceneData(
        sentences: codeNonNullIterable<String>(map['sentences'] as Iterable,
                (val) => val as String, <String>[]) ??
            getJserDefault('sentences'),
        responses: codeNonNullIterable<String>(map['responses'] as Iterable,
                (val) => val as String, <String>[]) ??
            getJserDefault('responses'),
        commands: codeNonNullIterable<String>(map['commands'] as Iterable,
                (val) => val as String, <String>[]) ??
            getJserDefault('commands'));
    return obj;
  }
}
