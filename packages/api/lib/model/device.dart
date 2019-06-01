import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'device.jser.dart';

class Device {
  @Alias('id')
  final int id;

  @Alias('roomId')
  final int roomId;

  @Alias('name')
  final String name;

  @Alias('driver')
  final String driver;

  @Alias('pluginName')
  final String pluginName;

  @Alias('type')
  final String type;

  @Alias('template')
  final Map<String, Object> template;

  @Alias('data')
  final Map<String, Object> data;

  @Alias('favorite')
  final bool favorite;

  Device(
      {this.id = null,
      this.roomId = null,
      this.name = null,
      this.driver = null,
      this.pluginName = null,
      this.type = null,
      this.template = const {},
      this.data = const {},
      this.favorite = null});

  @override
  String toString() {
    return 'Device[id=$id, roomId=$roomId, name=$name, driver=$driver, pluginName=$pluginName, type=$type, template=$template, data=$data, favorite=$favorite, ]';
  }
}

@GenSerializer(nullableFields: false)
class DeviceSerializer extends Serializer<Device> with _$DeviceSerializer {}
