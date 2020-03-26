import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'interact_request.jser.dart';

class InteractRequest {

  @Alias('sentence', isNullable: false,  )
  final String sentence;

  @Alias('lang', isNullable: false,  )
  final String lang;

  @Alias('context', isNullable: false,  )
  final Map<String, Object> context;


  InteractRequest(


{

     this.sentence = null,   this.lang = null,
     this.context = const {}

    }
  );

  @override
  String toString() {
    return 'InteractRequest[sentence=$sentence, lang=$lang, context=$context, ]';
  }
}

@GenSerializer(nullableFields: false)
class InteractRequestSerializer extends Serializer<InteractRequest> with _$InteractRequestSerializer {

}

