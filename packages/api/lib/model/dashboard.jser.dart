// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$DashboardSerializer implements Serializer<Dashboard> {
  Serializer<Device> __deviceSerializer;
  Serializer<Device> get _deviceSerializer =>
      __deviceSerializer ??= new DeviceSerializer();
  @override
  Map<String, dynamic> toMap(Dashboard model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'id', model.id);
    setMapValueIfNotNull(ret, 'roomId', model.roomId);
    setMapValueIfNotNull(ret, 'userId', model.userId);
    setMapValueIfNotNull(
        ret,
        'widgets',
        codeNonNullIterable(model.widgets,
            (val) => _deviceSerializer.toMap(val as Device), []));
    return ret;
  }

  @override
  Dashboard fromMap(Map map) {
    if (map == null) return null;
    final obj = new Dashboard(
        id: map['id'] as int ?? getJserDefault('id'),
        roomId: map['roomId'] as int ?? getJserDefault('roomId'),
        userId: map['userId'] as int ?? getJserDefault('userId'),
        widgets: codeNonNullIterable<Device>(map['widgets'] as Iterable,
                (val) => _deviceSerializer.fromMap(val as Map), <Device>[]) ??
            getJserDefault('widgets'));
    return obj;
  }
}
