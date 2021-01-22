import 'dart:io';

import 'package:file_chooser/file_chooser.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/file_fields/file_field.dart';

FileField createFileField({
  Key key,
  @required OnFileSelected onFileSelected,
}) =>
    FileFieldIO(key: key, onFileSelected: onFileSelected);

class FileFieldIO extends FileField {
  FileFieldIO({@required OnFileSelected onFileSelected, Key key}) : super(key: key, onFileSelected: onFileSelected);

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);

    return ElevatedButton(
      onPressed: () async {
        if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
          FilePickerResult file = await FilePicker.platform.pickFiles();
          onFileSelected(file.files.first.bytes, file.files.first.name);
        } else {
          showOpenPanel(
            (FileChooserResult result, List<String> paths) async {
              if (result == FileChooserResult.cancel && paths.isNotEmpty) {
                final file = File(paths.first);
                onFileSelected(await file.readAsBytes(), paths.first);
              }
            },
            allowsMultipleSelection: false,
            canSelectDirectories: false,
            allowedFileTypes: ['json'],
          );
        }
      },
      child: Text(translations.chooseFileButton.toUpperCase()),
    );
  }
}
