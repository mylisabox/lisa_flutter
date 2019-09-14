import 'package:jaguar_serializer/jaguar_serializer.dart';


part 'interact_response.jser.dart';

class InteractResponse {
  
  @Alias('action', isNullable: false,  )
  final String action;
  
  @Alias('lang', isNullable: false,  )
  final String lang;
  
  @Alias('userId', isNullable: false,  )
  final String userId;
  
  @Alias('userSentence', isNullable: false,  )
  final String userSentence;
  
  @Alias('response', isNullable: false,  )
  final String response;
  
  @Alias('responses', isNullable: false,  )
  final List<String> responses;
  

  InteractResponse(
      

{
    
     this.action = null,  
     this.lang = null,  
     this.userId = null,  
     this.userSentence = null,  
     this.response = null,  
     this.responses = const [] 
    }
  );

  @override
  String toString() {
    return 'InteractResponse[action=$action, lang=$lang, userId=$userId, userSentence=$userSentence, response=$response, responses=$responses, ]';
  }
}

@GenSerializer(nullableFields: false)
class InteractResponseSerializer extends Serializer<InteractResponse> with _$InteractResponseSerializer {

}

