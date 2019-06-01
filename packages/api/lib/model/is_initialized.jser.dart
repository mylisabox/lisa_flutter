// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_initialized.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$IsInitializedSerializer implements Serializer<IsInitialized> {
  @override
  Map<String, dynamic> toMap(IsInitialized model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'initialized', model.initialized);
    return ret;
  }

  @override
  IsInitialized fromMap(Map map) {
    if (map == null) return null;
    final obj = new IsInitialized(
        initialized:
            map['initialized'] as bool ?? getJserDefault('initialized'));
    return obj;
  }
}
