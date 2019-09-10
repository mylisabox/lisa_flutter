import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:lisa_server_sdk/model/device.dart';

part 'dashboard.jser.dart';

class Dashboard {

  @Alias('id')
  final int id;

  @Alias('roomId')
  final int roomId;

  @Alias('userId')
  final int userId;

  @Alias('widgets')
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

