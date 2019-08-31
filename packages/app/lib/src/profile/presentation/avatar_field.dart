import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/profile/presentation/avatar_field_base.dart';

typedef OnFileSelected = void Function(Uint8List data, String name);

abstract class AvatarField extends HookWidget {
  final OnFileSelected onFileSelected;

  factory AvatarField.create({Key key, @required OnFileSelected onFileSelected}) => createAvatarField(key: key, onFileSelected: onFileSelected);

  AvatarField({Key key, @required this.onFileSelected}) : super(key: key);
}
