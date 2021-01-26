//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:lisa_server_sdk/model/device.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dashboard.g.dart';

abstract class Dashboard implements Built<Dashboard, DashboardBuilder> {

    @BuiltValueField(wireName: r'id')
    int get id;

    @nullable
    @BuiltValueField(wireName: r'roomId')
    int get roomId;

    @BuiltValueField(wireName: r'userId')
    int get userId;

    @BuiltValueField(wireName: r'widgets')
    BuiltList<Device> get widgets;

    // Boilerplate code needed to wire-up generated code
    Dashboard._();

    static void _initializeBuilder(DashboardBuilder b) => b;

    factory Dashboard([void updates(DashboardBuilder b)]) = _$Dashboard;
    static Serializer<Dashboard> get serializer => _$dashboardSerializer;
}

