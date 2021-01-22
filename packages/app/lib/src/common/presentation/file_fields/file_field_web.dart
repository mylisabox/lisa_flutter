// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/file_fields/file_field.dart';

FileField createFileField({
  Key key,
  @required OnFileSelected onFileSelected,
}) =>
    FileFieldWeb(key: key, onFileSelected: onFileSelected);

class FileFieldWeb extends FileField {
  FileFieldWeb({
    Key key,
    @required OnFileSelected onFileSelected,
  }) : super(key: key, onFileSelected: onFileSelected);

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final uploadElement = useMemoized(() => FileUploadInputElement());
    uploadElement.id = 'customFile';
    uploadElement.className = 'customFile';
    uploadElement.setAttribute('style', '''
      height: 50px;
      width: 100px;
      opacity: 0;''');

    useEffect(() {
      uploadElement.onChange.listen((e) {
        File file = (e.target as dynamic).files[0];
        if (file != null) {
          final reader = FileReader();
          reader.onLoad.listen((e) {
            onFileSelected(reader.result, file.name);
          });
          reader.onError.listen((e) {
            print(e);
          });
          reader.readAsArrayBuffer(file);
        }
      });
      ui.platformViewRegistry.registerViewFactory('btn-file-picker', (int viewId) {
        return uploadElement;
      });
      return null;
    }, [uploadElement]);

    return ElevatedButton(
      onPressed: () {

      },
      child: Stack(
        children: [
          Text(translations.chooseFileButton.toUpperCase()),
          HtmlElementView(
            viewType: 'btn-file-picker',
          ),
        ],
      ),
    );
  }
}
