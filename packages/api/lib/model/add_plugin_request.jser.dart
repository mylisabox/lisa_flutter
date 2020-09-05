// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_plugin_request.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$AddPluginRequestSerializer
    implements Serializer<AddPluginRequest> {
  @override
  Map<String, dynamic> toMap(AddPluginRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'id', model.id);
    setMapValueIfNotNull(ret, 'version', model.version);
    setMapValueIfNotNull(ret, 'from', model.from);
    return ret;
  }

  @override
  AddPluginRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = AddPluginRequest(
        id: map['id'] as String ?? getJserDefault('id'),
        version: map['version'] as String ?? getJserDefault('version'),
        from: map['from'] as String ?? getJserDefault('from'));
    return obj;
  }
}
