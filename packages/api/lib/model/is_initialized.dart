//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'is_initialized.g.dart';

abstract class IsInitialized implements Built<IsInitialized, IsInitializedBuilder> {

    @BuiltValueField(wireName: r'initialized')
    bool get initialized;

    // Boilerplate code needed to wire-up generated code
    IsInitialized._();

    static void _initializeBuilder(IsInitializedBuilder b) => b;

    factory IsInitialized([void updates(IsInitializedBuilder b)]) = _$IsInitialized;
    static Serializer<IsInitialized> get serializer => _$isInitializedSerializer;
}

