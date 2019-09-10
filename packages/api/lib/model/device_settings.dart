import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'device_settings.jser.dart';

class DeviceSettings {

  @Alias('name')
  final String name;

  @Alias('driver')
  final String driver;

  @Alias('image')
  final String image;

  @Alias('pairing')
  final String pairing;

  @Alias('pluginName')
  final String pluginName;

  @Alias('description')
  final String description;

  @Alias('settings')
  final List<Map<String, Object>> settings;


  DeviceSettings(


{
     this.name = null,
     this.driver = null,
     this.image = null,
     this.pairing = null,
     this.pluginName = null,
     this.description = null,
     this.settings = const []

    }
  );

  @override
  String toString() {
    return 'DeviceSettings[name=$name, driver=$driver, image=$image, pairing=$pairing, pluginName=$pluginName, description=$description, settings=$settings, ]';
  }
}

@GenSerializer(nullableFields: false)
class DeviceSettingsSerializer extends Serializer<DeviceSettings> with _$DeviceSettingsSerializer {

}

