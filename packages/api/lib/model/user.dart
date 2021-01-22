//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {

    @BuiltValueField(wireName: r'id')
    int get id;

    @BuiltValueField(wireName: r'email')
    String get email;

    @nullable
    @BuiltValueField(wireName: r'firstname')
    String get firstname;

    @BuiltValueField(wireName: r'lang')
    String get lang;

    @nullable
    @BuiltValueField(wireName: r'lastname')
    String get lastname;

    @nullable
    @BuiltValueField(wireName: r'mobile')
    String get mobile;

    @nullable
    @BuiltValueField(wireName: r'avatar')
    String get avatar;

    // Boilerplate code needed to wire-up generated code
    User._();

    static void _initializeBuilder(UserBuilder b) => b;

    factory User([void updates(UserBuilder b)]) = _$User;
    static Serializer<User> get serializer => _$userSerializer;
}

