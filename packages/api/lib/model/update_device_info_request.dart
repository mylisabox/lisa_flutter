//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_device_info_request.g.dart';

abstract class UpdateDeviceInfoRequest implements Built<UpdateDeviceInfoRequest, UpdateDeviceInfoRequestBuilder> {

    @BuiltValueField(wireName: r'name')
    String get name;

    @BuiltValueField(wireName: r'roomId')
    int get roomId;

    // Boilerplate code needed to wire-up generated code
    UpdateDeviceInfoRequest._();

    static void _initializeBuilder(UpdateDeviceInfoRequestBuilder b) => b;

    factory UpdateDeviceInfoRequest([void updates(UpdateDeviceInfoRequestBuilder b)]) = _$UpdateDeviceInfoRequest;
    static Serializer<UpdateDeviceInfoRequest> get serializer => _$updateDeviceInfoRequestSerializer;
}

