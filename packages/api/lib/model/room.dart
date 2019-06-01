import 'package:jaguar_serializer/jaguar_serializer.dart';


part 'room.jser.dart';

class Room {
  
  @Alias('id')
  final int id;
  
  @Alias('name')
  final String name;
  

  Room(
      

{
    
     this.id = null,  
     this.name = null 
    }
  );

  @override
  String toString() {
    return 'Room[id=$id, name=$name, ]';
  }
}

@GenSerializer(nullableFields: false)
class RoomSerializer extends Serializer<Room> with _$RoomSerializer {

}

