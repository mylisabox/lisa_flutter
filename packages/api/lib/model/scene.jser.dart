// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scene.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$SceneSerializer implements Serializer<Scene> {
  Serializer<SceneData> __sceneDataSerializer;
  Serializer<SceneData> get _sceneDataSerializer =>
      __sceneDataSerializer ??= SceneDataSerializer();
  @override
  Map<String, dynamic> toMap(Scene model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'name', model.name);
    setMapValueIfNotNull(ret, 'displayName', model.displayName);
    setMapValueIfNotNull(ret, 'data', _sceneDataSerializer.toMap(model.data));
    return ret;
  }

  @override
  Scene fromMap(Map map) {
    if (map == null) return null;
    final obj = Scene(
        name: map['name'] as String ?? getJserDefault('name'),
        displayName:
            map['displayName'] as String ?? getJserDefault('displayName'),
        data: _sceneDataSerializer.fromMap(map['data'] as Map) ??
            getJserDefault('data'));
    return obj;
  }
}
