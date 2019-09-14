import 'package:jaguar_serializer/jaguar_serializer.dart';


import 'package:lisa_server_sdk/model/device.dart';

part 'dashboard.jser.dart';

class Dashboard {
  
  @Alias('id', isNullable: false,  )
  final int id;
  
  @Alias('roomId', isNullable: false,  )
  final int roomId;
  
  @Alias('userId', isNullable: false,  )
  final int userId;
  
  @Alias('widgets', isNullable: false,  )
  final List<Device> widgets;
  

  Dashboard(
      

{
    
     this.id = null,  
     this.roomId = null,  
     this.userId = null,  
     this.widgets = const [] 
    }
  );

  @override
  String toString() {
    return 'Dashboard[id=$id, roomId=$roomId, userId=$userId, widgets=$widgets, ]';
  }
}

@GenSerializer(nullableFields: false)
class DashboardSerializer extends Serializer<Dashboard> with _$DashboardSerializer {

}

