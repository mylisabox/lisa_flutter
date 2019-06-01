import 'package:jaguar_serializer/jaguar_serializer.dart';


part 'update_device_name_request.jser.dart';

class UpdateDeviceNameRequest {
  
  @Alias('name')
  final String name;
  

  UpdateDeviceNameRequest(
      

{
    
     this.name = null 
    }
  );

  @override
  String toString() {
    return 'UpdateDeviceNameRequest[name=$name, ]';
  }
}

@GenSerializer(nullableFields: false)
class UpdateDeviceNameRequestSerializer extends Serializer<UpdateDeviceNameRequest> with _$UpdateDeviceNameRequestSerializer {

}

