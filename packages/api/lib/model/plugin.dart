import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:lisa_server_sdk/model/device_settings.dart';

part 'plugin.jser.dart';

class Plugin {

  @Alias('id')
  final String id;

  @Alias('name')
  final String name;

  @Alias('description')
  final String description;

  @Alias('image')
  final String image;

  @Alias('devicesSettings')
  final List<DeviceSettings> devicesSettings;


  Plugin(


{

     this.id = null,
     this.name = null,
     this.description = null,   this.image = null,
     this.devicesSettings = const []

    }
  );

  @override
  String toString() {
    return 'Plugin[id=$id, name=$name, description=$description, image=$image, devicesSettings=$devicesSettings, ]';
  }
}

@GenSerializer(nullableFields: false)
class PluginSerializer extends Serializer<Plugin> with _$PluginSerializer {

}

