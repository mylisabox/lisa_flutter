import 'package:jaguar_serializer/jaguar_serializer.dart';


part 'scene_data.jser.dart';

class SceneData {
  
  @Alias('sentences')
  final List<String> sentences;
  
  @Alias('responses')
  final List<String> responses;
  
  @Alias('commands')
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

