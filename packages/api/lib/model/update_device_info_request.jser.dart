// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_device_info_request.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$UpdateDeviceInfoRequestSerializer
    implements Serializer<UpdateDeviceInfoRequest> {
  @override
  Map<String, dynamic> toMap(UpdateDeviceInfoRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'name', model.name);
    setMapValueIfNotNull(ret, 'roomId', model.roomId);
    return ret;
  }

  @override
  UpdateDeviceInfoRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = UpdateDeviceInfoRequest(
        name: map['name'] as String ?? getJserDefault('name'),
        roomId: map['roomId'] as int ?? getJserDefault('roomId'));
    return obj;
  }
}
