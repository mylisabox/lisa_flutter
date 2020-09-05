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

    return RaisedButton(
      onPressed: () async {
        if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
          File file = await FilePicker.getFile();
          onFileSelected(await file.readAsBytes(), file.path);
        } else {
          final result = await showOpenPanel(
            allowsMultipleSelection: false,
            canSelectDirectories: false,
            allowedFileTypes: [
              FileTypeFilterGroup(fileExtensions: ['json'])
            ],
          );
          if (!result.canceled && result.paths.isNotEmpty) {
            final file = File(result.paths.first);
            onFileSelected(await file.readAsBytes(), result.paths.first);
          }
        }
      },
      child: Text(translations.chooseFileButton.toUpperCase()),
    );
  }
}
