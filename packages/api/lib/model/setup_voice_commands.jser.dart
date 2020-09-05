// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_voice_commands.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$SetupVoiceCommandsSerializer
    implements Serializer<SetupVoiceCommands> {
  @override
  Map<String, dynamic> toMap(SetupVoiceCommands model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'config',
        codeNonNullIterable(model.config, (val) => val as int, []));
    return ret;
  }

  @override
  SetupVoiceCommands fromMap(Map map) {
    if (map == null) return null;
    final obj = SetupVoiceCommands(
        config: codeNonNullIterable<int>(
                map['config'] as Iterable, (val) => val as int, <int>[]) ??
            getJserDefault('config'));
    return obj;
  }
}
