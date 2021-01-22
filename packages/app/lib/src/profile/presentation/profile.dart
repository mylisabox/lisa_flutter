import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/dialogs.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/profile/presentation/avatar_field.dart';
import 'package:provider/provider.dart';
import 'package:proxy_layout/proxy_layout.dart';

class AvatarData {
  final Uint8List data;
  final String path;

  AvatarData(this.data, this.path);
}

_ProfileFormController useProfileManager(BuildContext context) {
  final userStore = Provider.of<UserStore>(context);
  final controllerEmail = useTextEditingController(text: userStore.user.email);
  final controllerFirst = useTextEditingController(text: userStore.user.firstname);
  final controllerLast = useTextEditingController(text: userStore.user.lastname);
  final controllerPhone = useTextEditingController(text: userStore.user.mobile);
  final controllerPassword = useTextEditingController();
  final controllerPasswordConfirmation = useTextEditingController();
  final avatar = useState<AvatarData>(null);

  return _ProfileFormController(
    lastName: controllerLast,
    firstName: controllerFirst,
    email: controllerEmail,
    phone: controllerPhone,
    password: controllerPassword,
    passwordConfirm: controllerPasswordConfirmation,
    avatarData: avatar,
  );
}

class _ProfileFormController {
  final TextEditingController lastName;
  final TextEditingController firstName;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController password;
  final TextEditingController passwordConfirm;
  final ValueNotifier<AvatarData> avatarData;

  _ProfileFormController({
    this.lastName,
    this.firstName,
    this.email,
    this.phone,
    this.password,
    this.passwordConfirm,
    this.avatarData,
  });

  Future<void> save(BuildContext context) {
    final userStore = Provider.of<UserStore>(context, listen: false);
    return userStore.updateUser(
      email: email.text,
      firstName: firstName.text.isEmpty ? null : firstName.text,
      lastName: lastName.text.isEmpty ? null : lastName.text,
      password: password.text.isEmpty ? null : password.text,
      phone: phone.text.isEmpty ? null : phone.text,
      avatarData: avatarData.value?.data,
      avatarName: avatarData.value?.path,
    );
  }
}

class ProfileDialog extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final translations = CommonLocalizations.of(context);
    final profileManager = useProfileManager(context);
    return Provider.value(
      value: profileManager,
      child: getAppDialog(
        context,
        (_) => Text(translations.profile),
        (_) => _ProfileWidget(),
        actions: [
          DialogAction(
              callback: (context) {
                Navigator.pop(context);
              },
              text: translations.cancel),
          DialogAction(
            isDefaultAction: true,
            text: translations.continueButton,
            callback: (context) async {
              final isSuccessful = await showLoadingDialog(
                context,
                (_) => Text(translations.profile),
                () async => profileManager.save(context),
                onError: (err, stack) => showErrorDialog(context, err, stack),
              );
              if (isSuccessful) {
                Navigator.of(context).pop();
                if (isSuccessful) {
                  final snackBar = SnackBar(content: Text(translations.profileSaved));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends HookWidget {
  static const route = '/profile';

  @override
  Widget build(BuildContext context) {
    final profileManager = useProfileManager(context);
    final translations = CommonLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(translations.profile),
      ),
      body: Provider.value(
        value: profileManager,
        child: _ProfileWidget(),
      ),
    );
  }
}

class _ProfileWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final bool modeDialog = DeviceProxy.isTablet(context);
    final translations = CommonLocalizations.of(context);
    final profileManager = Provider.of<_ProfileFormController>(context);

    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          padding: modeDialog ? EdgeInsets.zero : EdgeInsets.all(kNormalPadding),
          color: modeDialog ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor,
          child: AutofillGroup(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: kNormalPadding),
                      child: AvatarField.create(onFileSelected: (data, path) {
                        profileManager.avatarData.value = AvatarData(data, path);
                      }),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(labelText: translations.firstNameField),
                            textInputAction: TextInputAction.next,
                            controller: profileManager.firstName,
                            autofillHints: [AutofillHints.givenName],
                            onSubmitted: (_) {
                              FocusScope.of(context).focusInDirection(TraversalDirection.down);
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: translations.lastNameField),
                            controller: profileManager.lastName,
                            textInputAction: TextInputAction.next,
                            autofillHints: [AutofillHints.name],
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
                  controller: profileManager.email,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: [AutofillHints.email],
                  onSubmitted: (_) {
                    FocusScope.of(context).focusInDirection(TraversalDirection.down);
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: translations.phoneField),
                  controller: profileManager.phone,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  autofillHints: [AutofillHints.telephoneNumber],
                  onSubmitted: (_) {
                    FocusScope.of(context).focusInDirection(TraversalDirection.down);
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: translations.passwordField),
                  controller: profileManager.password,
                  autofillHints: [AutofillHints.newPassword],
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  onSubmitted: (_) {
                    FocusScope.of(context).focusInDirection(TraversalDirection.down);
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: translations.passwordConfirmationField),
                  controller: profileManager.passwordConfirm,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) {},
                ),
                Visibility(
                  visible: !modeDialog,
                  child: Padding(
                    padding: const EdgeInsets.only(top: kNormalPadding),
                    child: ElevatedButton(
                      onPressed: () async {
                        final isSuccessful = await showLoadingDialog(
                          context,
                          (_) => Text(translations.profile),
                          () async => profileManager.save(context),
                          onError: (err, stack) => showErrorDialog(context, err, stack),
                        );
                        if (isSuccessful) {
                          final snackBar = SnackBar(content: Text(translations.profileSaved));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                      ),
                      child: Text(translations.continueButton.toUpperCase()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
