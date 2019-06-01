import 'package:jaguar_serializer/jaguar_serializer.dart';


part 'pairing_device.jser.dart';

class PairingDevice {
  
  @Alias('name')
  final String name;
  
  @Alias('image')
  final String image;
  
  @Alias('id')
  final String id;
  

  PairingDevice(
      

{
    
     this.name = null,   this.image = null,  
     this.id = null 
    
    }
  );

  @override
  String toString() {
    return 'PairingDevice[name=$name, image=$image, id=$id, ]';
  }
}

@GenSerializer(nullableFields: false)
class PairingDeviceSerializer extends Serializer<PairingDevice> with _$PairingDeviceSerializer {

}

