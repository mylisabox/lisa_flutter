import 'dart:ui' as ui;
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/profile/presentation/avatar_field.dart';
import 'package:provider/provider.dart';

AvatarField createAvatarField({
  Key key,
  @required OnFileSelected onFileSelected,
}) =>
    AvatarFieldWeb(key: key, onFileSelected: onFileSelected);

class AvatarFieldWeb extends AvatarField {
  AvatarFieldWeb({
    Key key,
    @required OnFileSelected onFileSelected,
  }) : super(key: key, onFileSelected: onFileSelected);

  @override
  Widget build(BuildContext context) {
    //TODO test that this stuff is working ^^
    final userStore = Provider.of<UserStore>(context);
    ImageProvider avatarImage = userStore.avatar == null ? null : NetworkImage(userStore.avatar);
    final uploadElement = useMemoized(() => FileUploadInputElement());
    uploadElement.id = 'profileAvatar';
    uploadElement.className = 'profileAvatar';
    uploadElement.setAttribute('style', '''
      height: 60px;
      width: 60px;
      opacity: 0;''');

    useEffect(() {
      uploadElement.onChange.listen((e) {
        File file = (e.target as dynamic).files[0];
        if (file != null) {
          final reader = FileReader();
          reader.onLoad.listen((e) {
            print(reader.result);
            onFileSelected(reader.result, file.name);
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
