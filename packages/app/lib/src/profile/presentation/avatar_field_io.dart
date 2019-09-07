import 'dart:io';

import 'package:flutter/material.dart';
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
            final image = await ImagePicker.pickImage(source: ImageSource.gallery);
            avatar.value = image;
            onFileSelected(await image.readAsBytes(), image.path);
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
