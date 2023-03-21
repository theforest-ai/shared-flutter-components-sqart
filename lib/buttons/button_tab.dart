import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';
import 'package:shared-flutter-components-sqart/constants/styles.constant.dart';

class TabButton extends StatelessWidget {
  final String? buttonText;
  final GestureTapCallback? onPressed;
  final bool? roundShape;
  final bool? halfWidth;
  final Color? borderColor;
  final Color? textColor;
  final bool selected;

  const TabButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.roundShape,
    this.halfWidth,
    this.borderColor,
    this.textColor,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: halfWidth ?? false ? Get.width * .35 : null,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: selected ? squareartSecondary100 : borderColor ?? squareartNeutral.v0,
          border: Border.all(
              color: !selected ? borderColor ?? squareartTransparent : squareartSecondary100, width: 1, style: BorderStyle.solid),
          borderRadius: roundShape ?? false ? BorderRadius.circular(20) : BorderRadius.circular(8),
        ),
        child: Text(
          buttonText!,
          textAlign: TextAlign.center,
          style: customTextStyle(selected ? squareartNeutral.v0 : textColor ?? squareartNeutral.v100, 14, FontWeight.w500),
        ),
      ),
    );
  }
}
