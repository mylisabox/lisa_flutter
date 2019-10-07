import 'package:jaguar_serializer/jaguar_serializer.dart';


part 'device_settings.jser.dart';

class DeviceSettings {
  
  @Alias('name', isNullable: false,  )
  final String name;
  
  @Alias('driver', isNullable: false,  )
  final String driver;
  
  @Alias('image', isNullable: false,  )
  final String image;
  
  @Alias('pairing', isNullable: false,  )
  final String pairing;
  
  @Alias('pluginName', isNullable: false,  )
  final String pluginName;
  
  @Alias('description', isNullable: false,  )
  final String description;
  
  @Alias('type', isNullable: false,  )
  final String type;
  
  @Alias('template', isNullable: false,  )
  final Map<String, Object> template;
  
  @Alias('settings', isNullable: false,  )
  final Map<String, Object> settings;
  

  DeviceSettings(
      

{
     this.name = null,  
     this.driver = null,  
     this.image = null,  
     this.pairing = null,  
     this.pluginName = null,  
     this.description = null,  
     this.type = null,  
     this.template = const {},  
     this.settings = const {} 
    
    }
  );

  @override
  String toString() {
    return 'DeviceSettings[name=$name, driver=$driver, image=$image, pairing=$pairing, pluginName=$pluginName, description=$description, type=$type, template=$template, settings=$settings, ]';
  }
}

@GenSerializer(nullableFields: false)
class DeviceSettingsSerializer extends Serializer<DeviceSettings> with _$DeviceSettingsSerializer {

}

