import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/presentation/widgets/power_button.dart';
import 'package:lisa_flutter/src/common/utils/extensions.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Light extends HookWidget {
  final bool powered;
  final Color? color;
  final int? brightness;
  final bool dimmable;
  final void Function(Color color) onColorChange;
  final void Function(int brightness) onBrightnessChange;
  final void Function(bool powered) onPoweredChange;

  const Light({
    Key? key,
    this.brightness = 100,
    this.powered = false,
    this.dimmable = false,
    required this.onColorChange,
    required this.onBrightnessChange,
    required this.onPoweredChange,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainColor = Colors.yellow.shade600;

    final appearance = useMemoized(() {
      final customWidth = CustomSliderWidths(
        trackWidth: 5,
        progressBarWidth: 5,
        shadowWidth: 80,
        handlerSize: 15,
      );
      final customColors = CustomSliderColors(
        trackColor: powered ? mainColor.withOpacity(.4) : kDisabledColor,
        dotColor: powered ? mainColor : kDisabledColor,
        progressBarColor: powered ? mainColor : kDisabledColor,
        hideShadow: true,
        dynamicGradient: true,
      );
      final CircularSliderAppearance appearance = CircularSliderAppearance(
        customWidths: customWidth,
        customColors: customColors,
        size: 250.0,
        startAngle: 130,
        angleRange: 280,
        animationEnabled: true,
      );
      return appearance;
    }, [powered]);

    return Padding(
      padding: const EdgeInsets.all(kNormalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SleekCircularSlider(
            min: 0,
            max: 100,
            appearance: appearance,
            initialValue: brightness?.toDouble() ?? 50.0,
            innerWidget: (value) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Center(
                    child: PowerButton(
                      powered: powered,
                      color: powered ? mainColor : context.brightnessColor,
                      onTap: () {
                        onPoweredChange(!powered);
                      },
                    ),
                  ),
                  if (powered)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${value.round()} %',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: mainColor, fontSize: 28),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: kSmallPadding),
                            child: Text(
                              context.localizations.lightIntensity,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: mainColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            },
            onChangeEnd: (double value) {
              onBrightnessChange(value.round());
            },
          ),
          if (color != null && powered)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: kNormalPadding),
                child: ElevatedButton(
                  onPressed: () async {
                    final newColor = await _showDialog(context, color!);
                    if (newColor != null) {
                      onColorChange(newColor);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                    primary: color,
                  ),
                  child: null,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<Color?> _showDialog(BuildContext mainContext, Color color) {
    return showDialog(
      context: mainContext,
      builder: (context) {
        return HookBuilder(
          builder: (context) {
            final colorState = useState(color);
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: color,
                  onColorChanged: (color) {
                    colorState.value = color;
                  },
                  enableAlpha: false,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(MaterialLocalizations.of(context).okButtonLabel),
                  onPressed: () {
                    Navigator.of(context).pop(colorState.value);
                  },
                ),
              ],
            );
          }
        );
      },
    );
  }
}
