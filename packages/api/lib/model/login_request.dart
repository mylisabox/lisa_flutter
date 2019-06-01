import 'package:jaguar_serializer/jaguar_serializer.dart';


part 'login_request.jser.dart';

class LoginRequest {
  
  @Alias('email')
  final String email;
  
  @Alias('password')
  final String password;
  

  LoginRequest(
      

{
    
     this.email = null,  
     this.password = null 
    }
  );

  @override
  String toString() {
    return 'LoginRequest[email=$email, password=$password, ]';
  }
}

@GenSerializer(nullableFields: false)
class LoginRequestSerializer extends Serializer<LoginRequest> with _$LoginRequestSerializer {

}

