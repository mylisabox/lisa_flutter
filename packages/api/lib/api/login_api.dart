import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'dart:async';

import 'package:lisa_server_sdk/model/login_response.dart';
import 'package:lisa_server_sdk/model/login_request.dart';

part 'login_api.jretro.dart';

@GenApiClient()
class LoginApi extends ApiClient with _$LoginApiClient {
    final Route base;
    final Map<String, CodecRepo> converters;
    final Duration timeout;

    LoginApi({this.base, this.converters, this.timeout = const Duration(minutes: 2)});

    /// 
    ///
    /// 
    @PostReq(path: "/api/v1/auth/local")
    Future<LoginResponse> login(
            
             @AsJson() LoginRequest loginRequest
        ) {
        return super.login(

        
        loginRequest
        ).timeout(timeout);
    }

    /// 
    ///
    /// 
    @GetReq(path: "/api/v1/auth/logout", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<void> logout(
        ) {
        return super.logout(

        ).timeout(timeout);
    }

    /// 
    ///
    /// 
    @PostReq(path: "/api/v1/auth/register")
    Future<LoginResponse> register(
            
             @AsJson() LoginRequest loginRequest
        ) {
        return super.register(

        
        loginRequest
        ).timeout(timeout);
    }


}
