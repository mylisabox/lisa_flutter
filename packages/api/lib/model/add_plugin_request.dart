import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'add_plugin_request.jser.dart';

class AddPluginRequest {

  @Alias('id', isNullable: false,  )
  final String id;

  @Alias('version', isNullable: false,  )
  final String version;

  @Alias('from', isNullable: false,  )
  final String from;


  AddPluginRequest(


{
     this.id = null,
     this.version = null,
     this.from = null

    }
  );

  @override
  String toString() {
    return 'AddPluginRequest[id=$id, version=$version, from=$from, ]';
  }
}

@GenSerializer(nullableFields: false)
class AddPluginRequestSerializer extends Serializer<AddPluginRequest> with _$AddPluginRequestSerializer {

}

