import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/errors.dart';
import 'package:lisa_flutter/src/common/l10n/common_localizations.dart';

typedef DialogCallback = Function(BuildContext context);

class DialogAction {
  final DialogCallback callback;
  final String text;
  final bool isDefaultAction;
  final bool isDestructiveAction;

  DialogAction({@required this.callback, @required this.text, this.isDefaultAction = false, this.isDestructiveAction = false});

  @override
  bool operator ==(Object other) => identical(this, other) || other is DialogAction && runtimeType == other.runtimeType && text == other.text;

  @override
  int get hashCode => text.hashCode;
}

Future<bool> showConfirm(BuildContext context, String title, String content, {bool barrierDismissible = true, bool isDestructive = false}) {
  return showAppDialog(context, (_) => Text(title), (_) => Text(content), barrierDismissible: barrierDismissible, actions: [
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
  ]);
}

Future<String> showPrompt<T>(BuildContext context, String title, {TextEditingController controller, String initialValue, bool barrierDismissible = true, String hint}) {
  controller ??= TextEditingController(text: initialValue ?? '');
  return showAppDialog(
      context,
      (_) => Text(title),
      (_) => Material(
          color: Colors.transparent,
          child: HookBuilder(
            builder: (context) {
              final fieldController = useMemoized(() => controller, [controller]);

              useEffect(() {
                return fieldController.dispose;
              }, [fieldController]);

              return TextField(
                autofocus: true,
                controller: fieldController,
                onSubmitted: (_) {
                  Navigator.of(context).pop(controller.text);
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
            Navigator.of(context).pop(controller.text);
          },
        ),
      ]);
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
    return Colors.black;
  } else if (!action.isDefaultAction) {
    return Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white;
  }

  return Theme.of(context).primaryColor;
}

Future<T> showSelectDialog<T>(BuildContext context, WidgetBuilder title, List<T> data, IndexedWidgetBuilder itemBuilder,
    {bool barrierDismissible = true, itemExtent = 35.0}) {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    final Future<T> Function({BuildContext context, WidgetBuilder builder}) showCupertino = barrierDismissible ? showCupertinoModalPopup : showCupertinoDialog;
    return showCupertino(
        context: context,
        builder: (context) {
          return HookBuilder(
            builder: (context) {
              final selectedData = useState<T>(null);
              return Column(
                children: <Widget>[
                  Spacer(),
                  Container(
                    color: CupertinoColors.white,
                    child: Row(
                      children: <Widget>[
                        Spacer(),
                        CupertinoButton(
                          child: Text(
                            MaterialLocalizations.of(context).okButtonLabel,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context, selectedData.value);
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 230,
                    child: CupertinoPicker.builder(
                      onSelectedItemChanged: (int index) {
                        selectedData.value = data[index];
                      },
                      useMagnifier: true,
                      itemBuilder: itemBuilder,
                      childCount: data.length,
                      itemExtent: itemExtent,
                    ),
                  ),
                ],
              );
            },
          );
        });
  } else {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: title(context),
            children: [
              for (var i = 0; i < data.length; i++)
                SimpleDialogOption(
                  child: itemBuilder(context, i),
                  onPressed: () {
                    Navigator.pop(context, data[i]);
                  },
                )
            ],
          );
        });
  }
}

Widget getAppDialog(BuildContext context, WidgetBuilder title, WidgetBuilder content, {List<DialogAction> actions = const [], bool forceAndroid = false}) {
  if ((defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) && !forceAndroid) {
    return CupertinoAlertDialog(
      title: title(context),
      content: content(context),
      actions: actions
          .map((action) => CupertinoDialogAction(
                child: Text(
                  action.text,
                  style: TextStyle(color: _getColorForAction(context, action)),
                ),
                onPressed: action.callback == null ? null : () => action.callback(context),
                isDestructiveAction: action.isDestructiveAction,
                isDefaultAction: action.isDefaultAction,
              ))
          .toList(growable: false),
    );
  } else {
    return AlertDialog(
      title: title(context),
      content: content(context),
      actions: actions
          .map((action) => FlatButton(
                child: Text(
                  action.text,
                  style: TextStyle(color: _getColorForAction(context, action)),
                ),
                onPressed: action.callback == null ? null : () => action.callback(context),
              ))
          .toList(growable: false),
    );
  }
}

Future<T> showPlatformDialog<T>(BuildContext context, WidgetBuilder builder, {bool barrierDismissible = true}) {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    final Future<T> Function({BuildContext context, WidgetBuilder builder}) showCupertino = barrierDismissible ? showCupertinoDialog : showCupertinoModalPopup;
    return showCupertino(
      context: context,
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

Future<T> showAppDialog<T>(BuildContext context, WidgetBuilder title, WidgetBuilder content,
    {bool barrierDismissible = true, List<DialogAction> actions = const []}) {
  if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) {
    final Future<T> Function({BuildContext context, WidgetBuilder builder}) showCupertino = barrierDismissible ? showCupertinoDialog : showCupertinoModalPopup;
    return showCupertino(
      context: context,
      builder: (context) {
        return getAppDialog(context, title, content, actions: actions);
      },
    );
  }

  return showDialog(
      context: context,
      builder: (context) {
        return getAppDialog(context, title, content, actions: actions);
      },
      barrierDismissible: barrierDismissible);
}

Future<bool> showLoadingDialog(
  BuildContext mainContext,
  WidgetBuilder title,
  Future Function() until, {
  void Function(dynamic error, dynamic stack) onError,
  bool barrierDismissible = false,
}) {
  return showAppDialog<bool>(
      mainContext,
      title,
      (dialogContext) => IntrinsicHeight(
            child: Center(
              child: HookBuilder(
                builder: (context) {
                  useEffect(() {
                    until().then((_) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(dialogContext).pop(true);
                      });
                    }).catchError((err, stack) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
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

                  return CircularProgressIndicator();
                },
              ),
            ),
          ),
      barrierDismissible: barrierDismissible);
}

Future showErrorDialog(context, error, stack, {WidgetBuilder title, WidgetBuilder content}) {
  return showAppDialog(
      context,
      title == null ? (_) => Text(CommonLocalizations.of(context).dialogErrorTitle) : title(context),
      content == null
          ? (context) => Text(
                handleError(error, stack).cause.twoLiner(context),
                style: TextStyle(color: Colors.red),
              )
          : content(context),
      actions: [
        DialogAction(
            text: MaterialLocalizations.of(context).okButtonLabel,
            callback: (BuildContext context) {
              Navigator.of(context).pop();
            })
      ]);
}
