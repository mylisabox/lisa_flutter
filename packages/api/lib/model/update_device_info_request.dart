import 'package:jaguar_serializer/jaguar_serializer.dart';


part 'update_device_info_request.jser.dart';

class UpdateDeviceInfoRequest {
  
  @Alias('name', isNullable: false,  )
  final String name;
  
  @Alias('roomId', isNullable: false,  )
  final int roomId;
  

  UpdateDeviceInfoRequest(
      

{
    
     this.name = null,   this.roomId = null 
    
    }
  );

  @override
  String toString() {
    return 'UpdateDeviceInfoRequest[name=$name, roomId=$roomId, ]';
  }
}

@GenSerializer(nullableFields: false)
class UpdateDeviceInfoRequestSerializer extends Serializer<UpdateDeviceInfoRequest> with _$UpdateDeviceInfoRequestSerializer {

}

