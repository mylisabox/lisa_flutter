import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/bloc/user_bloc.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/utils/hooks.dart';
import 'package:lisa_flutter/src/profile/presentation/avatar_field.dart';
import 'package:provider/provider.dart';

class AvatarData {
  final Uint8List data;
  final String path;

  AvatarData(this.data, this.path);
}

class ProfileWidget extends HookWidget {
  static const route = '/profile';

  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final userBloc = Provider.of<UserBloc>(context);
    final controllerEmail = useTextEditingController(text: userBloc.user.email);
    final controllerFirst = useTextEditingController(text: userBloc.user.firstname);
    final controllerLast = useTextEditingController(text: userBloc.user.lastname);
    final controllerPhone = useTextEditingController(text: userBloc.user.mobile);
    final controllerPassword = useTextEditingController();
    final controllerPasswordConfirmation = useTextEditingController();
    final avatar = useState<AvatarData>(null);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(kNormalPadding),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: kNormalPadding),
                  child: AvatarField.create(onFileSelected: (data, path) {
                    avatar.value = AvatarData(data, path);
                  }),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: translations.firstNameField),
                        textInputAction: TextInputAction.next,
                        controller: controllerFirst,
                        onSubmitted: (_) {
                          FocusScope.of(context).focusInDirection(TraversalDirection.down);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: translations.lastNameField),
                        controller: controllerLast,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) {
                          FocusScope.of(context).focusInDirection(TraversalDirection.down);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            TextField(
              decoration: InputDecoration(labelText: translations.emailField),
              controller: controllerEmail,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onSubmitted: (_) {
                FocusScope.of(context).focusInDirection(TraversalDirection.down);
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: translations.phoneField),
              controller: controllerPhone,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) {
                FocusScope.of(context).focusInDirection(TraversalDirection.down);
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: translations.passwordField),
              controller: controllerPassword,
              textInputAction: TextInputAction.next,
              obscureText: true,
              onSubmitted: (_) {
                FocusScope.of(context).focusInDirection(TraversalDirection.down);
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: translations.passwordConfirmationField),
              controller: controllerPasswordConfirmation,
              obscureText: true,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: kNormalPadding),
              child: RaisedButton(
                onPressed: () async {
                  final isSuccessful = await showLoadingDialog(
                    context,
                    (_) => Text(translations.profile),
                    () async => userBloc.updateUser(
                      email: controllerEmail.text,
                      firstName: controllerFirst.text.isEmpty ? null : controllerFirst.text,
                      lastName: controllerLast.text.isEmpty ? null : controllerLast.text,
                      password: controllerPassword.text.isEmpty ? null : controllerPassword.text,
                      phone: controllerPhone.text.isEmpty ? null : controllerPhone.text,
                      avatarData: avatar.value?.data,
                      avatarName: avatar.value?.path,
                    ),
                    onError: (err) => showErrorDialog(context, err, null),
                  );
                  if (isSuccessful) {
                    Navigator.of(context).pop();
                  }
                },
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Text(translations.continueButton.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
