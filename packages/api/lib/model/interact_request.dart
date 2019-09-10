import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'interact_request.jser.dart';

class InteractRequest {

  @Alias('sentence')
  final String sentence;

  @Alias('lang')
  final String lang;


  InteractRequest(


{

     this.sentence = null,   this.lang = null

    }
  );

  @override
  String toString() {
    return 'InteractRequest[sentence=$sentence, lang=$lang, ]';
  }
}

@GenSerializer(nullableFields: false)
class InteractRequestSerializer extends Serializer<InteractRequest> with _$InteractRequestSerializer {

}

