import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'setup_voice_commands.jser.dart';

class SetupVoiceCommands {

  @Alias('config', isNullable: false,  )
  final List<int> config;


  SetupVoiceCommands(


{
     this.config = null

    }
  );

  @override
  String toString() {
    return 'SetupVoiceCommands[config=$config, ]';
  }
}

@GenSerializer(nullableFields: false)
class SetupVoiceCommandsSerializer extends Serializer<SetupVoiceCommands> with _$SetupVoiceCommandsSerializer {

}

