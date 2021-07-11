import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/presentation/file_fields/file_field_base.dart';

typedef OnFileSelected = void Function(Uint8List data, String name);

abstract class FileField extends HookWidget {
  final OnFileSelected onFileSelected;

  factory FileField.create({Key? key, required OnFileSelected onFileSelected}) => createFileField(key: key, onFileSelected: onFileSelected);

  FileField({Key? key, required this.onFileSelected}) : super(key: key);
}
