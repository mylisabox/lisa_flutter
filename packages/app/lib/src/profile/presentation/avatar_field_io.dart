import 'dart:io';

import 'package:file_chooser/file_chooser.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/profile/presentation/avatar_field.dart';
import 'package:provider/provider.dart';

AvatarField createAvatarField({
  Key key,
  @required OnFileSelected onFileSelected,
}) =>
    AvatarFieldIO(key: key, onFileSelected: onFileSelected);

class AvatarFieldIO extends AvatarField {
  AvatarFieldIO({@required OnFileSelected onFileSelected, Key key}) : super(key: key, onFileSelected: onFileSelected);

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
    final avatar = useState<File>(null);

    ImageProvider avatarImage = userStore.avatar == null ? null : NetworkImage(userStore.avatar);

    if (avatar.value != null) {
      avatarImage = FileImage(avatar.value);
    }

    return CircleAvatar(
      radius: 30,
      backgroundImage: avatarImage,
      child: Material(
        color: Colors.transparent,
        type: MaterialType.circle,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () async {
            if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
              final image = await ImagePicker().getImage(source: ImageSource.gallery);
              final file = File(image.path);
              avatar.value = file;
              onFileSelected(await image.readAsBytes(), image.path);
            } else {
              final result = await showOpenPanel(
                allowsMultipleSelection: false,
                canSelectDirectories: false,
                allowedFileTypes: [
                  FileTypeFilterGroup(fileExtensions: ['jpg', 'jpeg', 'png'])
                ],
              );
              if (!result.canceled && result.paths.isNotEmpty) {
                final file = File(result.paths.first);
                avatar.value = file;
                onFileSelected(await file.readAsBytes(), result.paths.first);
              }
            }
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Icon(
              Icons.edit,
            ),
          ),
        ),
      ),
    );
  }
}
