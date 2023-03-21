import 'package:flutter/material.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';

class CircleButton extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final Color? borderColor;
  final Color? textColor;
  final IconData? icon;

  const CircleButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.borderColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.all(4.0),
        minimumSize: const Size(0, 0),
        primary: borderColor ?? squareartSecondary900, // <-- Button color
        onPrimary: borderColor ?? squareartSecondary900, // <-- Splash color
      ),
      child: Icon(
        icon,
        color: textColor ?? squareartSecondary100,
        size: 18,
      ),
    );
  }
}
