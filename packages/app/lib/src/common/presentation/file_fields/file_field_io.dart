
import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/file_fields/file_field.dart';

FileField createFileField({
  Key? key,
  required OnFileSelected onFileSelected,
}) =>
    FileFieldIO(key: key, onFileSelected: onFileSelected);

class FileFieldIO extends FileField {
  FileFieldIO({required OnFileSelected onFileSelected, Key? key}) : super(key: key, onFileSelected: onFileSelected);

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);

    return ElevatedButton(
      onPressed: () async {
        if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
          FilePickerResult? file = await FilePicker.platform.pickFiles();
          if (file != null) {
            onFileSelected(file.files.first.bytes!, file.files.first.name);
          }
        } else {
          final typeGroup = XTypeGroup(label: 'configuration', extensions: ['json']);
          final file = await openFile(acceptedTypeGroups: [typeGroup]);
          if (file != null) {
            onFileSelected(await file.readAsBytes(), file.name);
          }
        }
      },
      child: Text(translations.chooseFileButton.toUpperCase()),
    );
  }
}
