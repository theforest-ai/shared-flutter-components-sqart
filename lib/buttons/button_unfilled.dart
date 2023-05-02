import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_flutter_components_sqart/constants/color.constant.dart';
import 'package:shared_flutter_components_sqart/constants/styles.constant.dart';

class UnfilledButton extends StatelessWidget {
  final String? buttonText;
  final GestureTapCallback? onPressed;
  final bool? roundShape;
  final bool? halfWidth;
  final Color? borderColor;
  final Color? textColor;
  final double? textSize;
  final double? height;
  final EdgeInsets? padding;
  final  double? borderRadius;

  const UnfilledButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      this.roundShape,
      this.halfWidth,
      this.borderColor,
      this.textColor,
      this.textSize,
      this.borderRadius,
      this.padding,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: halfWidth != null
            ? halfWidth!
                ? Get.width * .35
                : null
            : null,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: squareartNeutral.v0,
          border: Border.all(color: borderColor == null ? squareartNeutral.v100 : borderColor!, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(borderRadius??8),
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
