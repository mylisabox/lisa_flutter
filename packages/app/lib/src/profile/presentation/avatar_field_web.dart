// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/profile/presentation/avatar_field.dart';
import 'package:provider/provider.dart';

AvatarField createAvatarField({
  Key? key,
  required OnFileSelected onFileSelected,
}) =>
    AvatarFieldWeb(key: key, onFileSelected: onFileSelected);

class AvatarFieldWeb extends AvatarField {
  AvatarFieldWeb({
    Key? key,
    required OnFileSelected onFileSelected,
  }) : super(key: key, onFileSelected: onFileSelected);

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
    ImageProvider? avatarImage = userStore.avatar == null ? null : NetworkImage(userStore.avatar!);
    final uploadElement = useMemoized(() => FileUploadInputElement());
    uploadElement.id = 'profileAvatar';
    uploadElement.className = 'profileAvatar';
    uploadElement.setAttribute('style', '''
      height: 60px;
      width: 60px;
      opacity: 0;''');

    final avatar = useState<Uint8List?>(null);

    if (avatar.value != null) {
      avatarImage = MemoryImage(avatar.value!);
    }

    useEffect(() {
      uploadElement.onChange.listen((e) {
        var file = (e.target as dynamic).files[0];
        if (file != null) {
          final reader = FileReader();
          reader.onLoad.listen((e) {
            avatar.value = reader.result as Uint8List;
            onFileSelected(reader.result as Uint8List, file.name);
          });
          reader.onError.listen((e) {
            print(e);
          });
          reader.readAsArrayBuffer(file);
        }
      });
      ui.platformViewRegistry.registerViewFactory('btn-upload', (int viewId) {
        return uploadElement;
      });
      return null;
    }, [uploadElement]);

    return CircleAvatar(
      radius: 30,
      backgroundColor: Theme.of(context).primaryColor,
      backgroundImage: avatarImage,
      child: Material(
        color: Colors.transparent,
        type: MaterialType.circle,
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Icon(
                Icons.edit,
              ),
            ),
            HtmlElementView(
              viewType: 'btn-upload',
            ),
          ],
        ),
      ),
    );
  }
}
