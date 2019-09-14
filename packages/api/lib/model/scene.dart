import 'package:jaguar_serializer/jaguar_serializer.dart';


import 'package:lisa_server_sdk/model/scene_data.dart';

part 'scene.jser.dart';

class Scene {
  
  @Alias('name', isNullable: false,  )
  final String name;
  
  @Alias('displayName', isNullable: false,  )
  final String displayName;
  
  @Alias('data', isNullable: false,  )
  final SceneData data;
  

  Scene(
      

{
    
     this.name = null,  
     this.displayName = null,  
     this.data = null 
    }
  );

  @override
  String toString() {
    return 'Scene[name=$name, displayName=$displayName, data=$data, ]';
  }
}

@GenSerializer(nullableFields: false)
class SceneSerializer extends Serializer<Scene> with _$SceneSerializer {

}

