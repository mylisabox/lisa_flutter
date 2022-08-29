import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';
import 'package:lisa_flutter/src/common/presentation/loading.dart';
import 'package:lisa_flutter/src/common/utils/extensions.dart';
import 'package:lisa_flutter/src/common/utils/modal_page_route.dart';

typedef DialogCallback = Function(BuildContext context);

class LisaDialog extends StatelessWidget {
  final Widget title;
  final Widget content;
  final List<DialogAction> actions;
  final BoxConstraints? constraints;

  const LisaDialog({Key? key, this.constraints, required this.content, required this.title, this.actions = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: constraints ?? const BoxConstraints(),
        child: Dialog(
          insetPadding: const EdgeInsets.all(24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kNormalPadding),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: kNormalPadding, bottom: actions.isEmpty ? kNormalPadding : 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: kNormalPadding),
                        child: DefaultTextStyle(child: title, style: context.textTheme.headline5!),
                      ),
                    ),
                    CloseButton(color: context.brightnessColor),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kNormalPadding),
                  child: Divider(height: 1, color: context.dividerColor),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kNormalPadding),
                  child: content,
                ),
                if (actions.isNotEmpty)
                  ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: actions
                        .map(
                          (action) => TextButton(
                            child: Text(
                              action.text,
                              style: TextStyle(color: _getColorForAction(context, action)),
                            ),
                            onPressed: action.callback == null ? null : () => action.callback!(context),
                          ),
                        )
                        .toList(growable: false),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DialogAction {
  final DialogCallback? callback;
  final String text;
  final bool isDefaultAction;
  final bool isDestructiveAction;

  DialogAction({required this.callback, required this.text, this.isDefaultAction = false, this.isDestructiveAction = false});

  @override
  bool operator ==(Object other) => identical(this, other) || other is DialogAction && runtimeType == other.runtimeType && text == other.text;

  @override
  int get hashCode => text.hashCode;
}

Future<bool> showConfirm(BuildContext context, String title, String content, {bool barrierDismissible = true, bool isDestructive = false}) async {
  return (await showAppDialog(context, (_) => Text(title), (_) => Text(content), barrierDismissible: barrierDismissible, actions: [
        DialogAction(
          text: MaterialLocalizations.of(context).cancelButtonLabel,
          callback: (context) {
            Navigator.of(context).pop(false);
          },
        ),
        DialogAction(
          isDestructiveAction: isDestructive,
          isDefaultAction: true,
          text: MaterialLocalizations.of(context).okButtonLabel,
          callback: (context) {
            Navigator.of(context).pop(true);
          },
        ),
      ]) ??
      false);
}

Future<String?> showPrompt<T>(BuildContext context, String title,
    {TextEditingController? controller, String? initialValue, bool barrierDismissible = true, String? hint}) {
  controller ??= TextEditingController(text: initialValue ?? '');
  return showAppDialog(
    context,
    (_) => Text(title),
    (_) => Material(
        color: Colors.transparent,
        child: HookBuilder(
          builder: (context) {
            final fieldController = useMemoized(() => controller!, [controller]);

            useEffect(() {
              return fieldController.dispose;
            }, [fieldController]);

            return TextField(
              autofocus: true,
              controller: fieldController,
              onSubmitted: (_) {
                Navigator.of(context).pop(fieldController.text);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: hint,
              ),
            );
          },
        )),
    barrierDismissible: barrierDismissible,
    actions: [
      DialogAction(
        text: MaterialLocalizations.of(context).cancelButtonLabel,
        callback: (context) {
          Navigator.of(context).pop(null);
        },
      ),
      DialogAction(
        isDefaultAction: true,
        text: MaterialLocalizations.of(context).okButtonLabel,
        callback: (context) {
          Navigator.of(context).pop(controller!.text);
        },
      ),
    ],
  );
}

Future<void> showAlert<T>(BuildContext context, String title, WidgetBuilder content, {bool barrierDismissible = true}) {
  return showAppDialog(context, (_) => Text(title), content, barrierDismissible: barrierDismissible, actions: [
    DialogAction(
      text: MaterialLocalizations.of(context).cancelButtonLabel,
      callback: (context) {
        Navigator.of(context).pop();
      },
    ),
    DialogAction(
      isDefaultAction: true,
      text: MaterialLocalizations.of(context).okButtonLabel,
      callback: (context) {
        Navigator.of(context).pop();
      },
    ),
  ]);
}

Color _getColorForAction(BuildContext context, DialogAction action) {
  if (action.callback == null) {
    return Colors.grey;
  }

  if (action.isDestructiveAction) {
    return Colors.red;
  }

  if (!action.isDefaultAction && defaultTargetPlatform == TargetPlatform.iOS) {
    return context.primaryColor;
  } else if (!action.isDefaultAction) {
    return context.brightnessColor;
  }

  return Theme.of(context).primaryColor;
}

Future<T?> showSelectDialog<T>(BuildContext context, WidgetBuilder title, List<T> data, IndexedWidgetBuilder itemBuilder,
    {bool barrierDismissible = true, itemExtent = 35.0}) {
  return showAppDialog(
    context,
    title,
    (_) => Column(children: [
      for (var i = 0; i < data.length; i++)
        SimpleDialogOption(
          child: itemBuilder(context, i),
          onPressed: () {
            Navigator.pop(context, data[i]);
          },
        )
    ]),
  );
}

Widget getAppDialog(
  BuildContext context,
  WidgetBuilder title,
  WidgetBuilder content, {
  List<DialogAction> actions = const [],
  bool forceAndroid = false,
  double? maxWidth = 500,
}) {
  return LisaDialog(
    title: title(context),
    content: content(context),
    actions: actions,
    constraints: maxWidth == null ? null : BoxConstraints(maxWidth: maxWidth),
  );
}

Future<T?> showPlatformDialog<T>(BuildContext context, WidgetBuilder builder, {bool barrierDismissible = true}) {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return showCupertinoModalPopup<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return builder(context);
      },
    );
  }

  return showDialog(
      context: context,
      builder: (context) {
        return builder(context);
      },
      barrierDismissible: barrierDismissible);
}

Future<T?> showRawDialog<T>(BuildContext context, WidgetBuilder builder, {RouteSettings? settings, bool barrierDismissible = true}) {
  return context.navigator.push(
    ModalPageRoute(
      builder: (context) => builder(context),
      settings: settings,
      barrierDismissible: barrierDismissible,
    ),
  );
}

Future<T?> showAppDialog<T>(BuildContext context, WidgetBuilder title, WidgetBuilder content,
    {bool barrierDismissible = true, List<DialogAction> actions = const [], RouteSettings? settings}) {
  return context.navigator.push(
    ModalPageRoute(
      builder: (context) => getAppDialog(context, title, content, actions: actions),
      settings: settings,
      barrierDismissible: barrierDismissible,
    ),
  );
}

Future<bool> showLoadingDialog(
  BuildContext mainContext,
  WidgetBuilder title,
  Future Function() until, {
  void Function(dynamic error, dynamic stack)? onError,
  bool barrierDismissible = false,
}) async {
  return (await showAppDialog<bool>(
          mainContext,
          title,
          (dialogContext) => IntrinsicHeight(
                child: Center(
                  child: HookBuilder(
                    builder: (context) {
                      useEffect(() {
                        until().then((_) {
                          WidgetsBinding.instance?.addPostFrameCallback((_) {
                            Navigator.of(dialogContext).pop(true);
                          });
                        }).catchError((err, stack) {
                          WidgetsBinding.instance?.addPostFrameCallback((_) {
                            Navigator.of(dialogContext).pop(false);
                            if (onError == null) {
                              showErrorDialog(mainContext, err, stack);
                            } else {
                              onError(err, stack);
                            }
                          });
                        });
                        return null;
                      }, const []);

                      return const Loading();
                    },
                  ),
                ),
              ),
          barrierDismissible: barrierDismissible) ??
      false);
}

Future showErrorDialog(context, error, stack, {WidgetBuilder? title, WidgetBuilder? content}) {
  return showAppDialog(
    context,
    (title == null ? (_) => Text(CommonLocalizations.of(context).dialogErrorTitle) : title(context) as WidgetBuilder),
    (content == null
        ? (context) => Text(
              handleError(error, stack).cause.twoLiner(context),
              style: const TextStyle(color: Colors.red),
            )
        : content(context) as WidgetBuilder),
    actions: [
      DialogAction(
        text: MaterialLocalizations.of(context).okButtonLabel,
        callback: (BuildContext context) {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
