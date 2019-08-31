import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_web_ui/ui.dart' as ui;
import 'package:lisa_flutter/src/common/bloc/user_bloc.dart';
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
    final userBloc = Provider.of<UserBloc>(context);
    ImageProvider avatarImage = userBloc.avatar == null ? null : NetworkImage(userBloc.avatar);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        print('TEST FILE UPLOAD');
        final _upload = FileUploadInputElement();
        _upload.onChange.listen((e) {
          //File file = (e.target as dynamic).files[0];
          //if (file != null) {}
        });
        if (ui.platformViewRegistry.registerViewFactory('btn-upload', (int viewId) => _upload)) {
          print('TEST FILE UPLOAD REGISTERED');
        } else {
          print('TEST FILE UPLOAD NOT REGISTERED');
        }
      });
      return null;
    }, const []);

    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.red,
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
