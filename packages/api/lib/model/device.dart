import 'package:jaguar_serializer/jaguar_serializer.dart';


part 'device.jser.dart';

class Device {
  
  @Alias('id', isNullable: false,  )
  final int id;
  
  @Alias('roomId', isNullable: false,  )
  final int roomId;
  
  @Alias('name', isNullable: false,  )
  final String name;
  
  @Alias('driver', isNullable: false,  )
  final String driver;
  
  @Alias('pluginName', isNullable: false,  )
  final String pluginName;
  
  @Alias('type', isNullable: false,  )
  final String type;
  
  @Alias('template', isNullable: false,  )
  final Map<String, Object> template;
  
  @Alias('data', isNullable: false,  )
  final Map<String, Object> data;
  
  @Alias('favorite', isNullable: false,  )
  final bool favorite;
  

  Device(
      

{
    
     this.id = null,   this.roomId = null,  
    
     this.name = null,  
     this.driver = null,  
     this.pluginName = null,  
     this.type = null,  
     this.template = const {},   this.data = const {},  
    
     this.favorite = null 
    }
  );

  @override
  String toString() {
    return 'Device[id=$id, roomId=$roomId, name=$name, driver=$driver, pluginName=$pluginName, type=$type, template=$template, data=$data, favorite=$favorite, ]';
  }
}

@GenSerializer(nullableFields: false)
class DeviceSerializer extends Serializer<Device> with _$DeviceSerializer {

}

