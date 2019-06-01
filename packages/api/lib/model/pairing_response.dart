import 'package:jaguar_serializer/jaguar_serializer.dart';


import 'package:lisa_server_sdk/model/pairing_device.dart';

part 'pairing_response.jser.dart';

class PairingResponse {
  
  @Alias('singleChoice')
  final bool singleChoice;
  
  @Alias('devices')
  final PairingDevice devices;
  
  @Alias('step')
  final String step;
  

  PairingResponse(
      

{
     this.singleChoice = null,  
     this.devices = null,  
    
     this.step = null 
    }
  );

  @override
  String toString() {
    return 'PairingResponse[singleChoice=$singleChoice, devices=$devices, step=$step, ]';
  }
}

@GenSerializer(nullableFields: false)
class PairingResponseSerializer extends Serializer<PairingResponse> with _$PairingResponseSerializer {

}

