import 'package:flutter/material.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/utils/extensions.dart';

class PowerButton extends StatelessWidget {
  final bool powered;
  final Color? color;
  final VoidCallback? onTap;

  const PowerButton({Key? key, this.onTap, this.color, this.powered = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(25),
        primary: Colors.grey.shade800,
        onSurface: kDisabledColor,
      ),
      child: Icon(Icons.power_settings_new, color: color ?? context.brightnessColor),
    );
  }
}
