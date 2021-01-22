//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// ignore_for_file: unused_import

import 'package:lisa_server_sdk/model/user.dart';

part 'login_response.g.dart';

abstract class LoginResponse implements Built<LoginResponse, LoginResponseBuilder> {

    @BuiltValueField(wireName: r'token')
    String get token;

    @BuiltValueField(wireName: r'user')
    User get user;

    // Boilerplate code needed to wire-up generated code
    LoginResponse._();

    static void _initializeBuilder(LoginResponseBuilder b) => b;

    factory LoginResponse([void updates(LoginResponseBuilder b)]) = _$LoginResponse;
    static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;
}

