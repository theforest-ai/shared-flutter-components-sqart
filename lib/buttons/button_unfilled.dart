import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';
import 'package:shared-flutter-components-sqart/constants/styles.constant.dart';

class UnfilledButton extends StatelessWidget {
  final String? buttonText;
  final GestureTapCallback? onPressed;
  final bool? roundShape;
  final bool? halfWidth;
  final Color? borderColor;
  final Color? textColor;
  final double? textSize;

  const UnfilledButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.roundShape,
    this.halfWidth,
    this.borderColor,
    this.textColor,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: halfWidth != null
            ? halfWidth!
                ? Get.width * .35
                : null
            : null,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: squareartNeutral.v0,
          border: Border.all(color: borderColor == null ? squareartNeutral.v100 : borderColor!, width: 1, style: BorderStyle.solid),
          borderRadius: roundShape != null
              ? roundShape!
                  ? BorderRadius.circular(20)
                  : BorderRadius.circular(8)
              : BorderRadius.circular(8),
        ),
        child: Text(
          buttonText!,
          textAlign: TextAlign.center,
          style: customTextStyle(textColor ?? squareartNeutral.v100, textSize ?? 14, FontWeight.w500),
        ),
      ),
    );
  }
}
