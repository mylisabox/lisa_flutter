import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'store_plugin.jser.dart';

class StorePlugin {

  @Alias('id', isNullable: false,  )
  final String id;

  @Alias('name', isNullable: false,  )
  final String name;

  @Alias('description', isNullable: false,  )
  final String description;

  @Alias('installed', isNullable: false,  )
  final bool installed;


  StorePlugin(


{

     this.id = null,
     this.name = null,
     this.description = null,   this.installed = null

    }
  );

  @override
  String toString() {
    return 'StorePlugin[id=$id, name=$name, description=$description, installed=$installed, ]';
  }
}

@GenSerializer(nullableFields: false)
class StorePluginSerializer extends Serializer<StorePlugin> with _$StorePluginSerializer {

}

