import 'package:jaguar_serializer/jaguar_serializer.dart';


part 'scene_data.jser.dart';

class SceneData {
  
  @Alias('sentences', isNullable: false,  )
  final List<String> sentences;
  
  @Alias('responses', isNullable: false,  )
  final List<String> responses;
  
  @Alias('commands', isNullable: false,  )
  final List<String> commands;
  

  SceneData(
      

{
     this.sentences = const [],  
     this.responses = const [],  
     this.commands = const [] 
    
    }
  );

  @override
  String toString() {
    return 'SceneData[sentences=$sentences, responses=$responses, commands=$commands, ]';
  }
}

@GenSerializer(nullableFields: false)
class SceneDataSerializer extends Serializer<SceneData> with _$SceneDataSerializer {

}

