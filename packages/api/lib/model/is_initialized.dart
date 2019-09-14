import 'package:jaguar_serializer/jaguar_serializer.dart';


part 'is_initialized.jser.dart';

class IsInitialized {
  
  @Alias('initialized', isNullable: false,  )
  final bool initialized;
  

  IsInitialized(
      

{
    
     this.initialized = null 
    }
  );

  @override
  String toString() {
    return 'IsInitialized[initialized=$initialized, ]';
  }
}

@GenSerializer(nullableFields: false)
class IsInitializedSerializer extends Serializer<IsInitialized> with _$IsInitializedSerializer {

}

