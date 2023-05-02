// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shared_flutter_components_sqart/constants/color.constant.dart';
import 'package:shared_flutter_components_sqart/constants/styles.constant.dart';

class FullFilledButton extends StatelessWidget {
  final String? buttonText;
  final GestureTapCallback? onPressed;
  final bool? isDisabled;
  final bool? isLoading;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final Size? size;
  bool? isOutline = false;
  final EdgeInsets? padding;
  double? elevation;
  double? borderRadius;
  FullFilledButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      required this.isDisabled,
      this.isLoading = false,
      this.isOutline,
      this.color,
      this.borderColor,
      this.textColor,
      this.padding,
      this.size,
      this.borderRadius,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    isOutline ??= false;
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        onPressed: isDisabled! ? null : onPressed,
        style: ElevatedButton.styleFrom(
            elevation: elevation,
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            visualDensity: const VisualDensity(vertical: -2, horizontal: 1),
            side: BorderSide(width: isOutline! ? 1.0 : 0.0, color: borderColor ?? Colors.transparent),
            primary: color ?? squareartNeutral.v100,
            fixedSize: size ?? Size(width * .9, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius??8.0),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customText(buttonText!, 14, FontWeight.w500, isOutline! && color != null ? color! : textColor ?? squareartNeutral.v0,
                maxLine: 2, textAlign: TextAlign.center),
            if (isLoading ?? false) ...[
              horizontalSmallSpace,
              SizedBox(
                width: 10,
                height: 10,
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  color: squareartNeutral.v0,
                ),
              )
            ]
          ],
        ));
  }
}