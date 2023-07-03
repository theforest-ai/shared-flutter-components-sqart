import 'package:flutter/material.dart';
import 'package:shared_flutter_components_sqart/constants/color.constant.dart';
import 'package:shared_flutter_components_sqart/constants/styles.constant.dart';

// ignore: must_be_immutable
class FullFilledButtonNew extends StatelessWidget {
  final String? buttonText;
  final GestureTapCallback? onPressed;
  final bool? isDisabled;
  final bool? isLoading;
  final Color? color;
  final Color? textColor;
  bool? isOutline = false;
  final EdgeInsets? padding;
  FullFilledButtonNew({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.isDisabled,
    this.isLoading = false,
    this.isOutline,
    this.color,
    this.textColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    isOutline ??= false;
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        onPressed: isDisabled! ? null : onPressed,
        style: ElevatedButton.styleFrom(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            visualDensity: const VisualDensity(vertical: -2, horizontal: 1),
            side: BorderSide(
              width: isOutline! ? 1.0 : 0.0,
              color: isOutline! ? color ?? squareartNeutral.v100 : color ?? squareartNeutral.v100,
            ),
            primary: isOutline! ? squareartNeutral.v0 : color ?? squareartNeutral.v100,
            fixedSize: Size(width * .9, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customText(buttonText!, 14, FontWeight.w500, isOutline! && color != null ? color! : textColor ?? squareartNeutral.v0,
                maxLine: 2, textAlign: TextAlign.center),
            horizontalSmallSpace,
            isLoading!
                ? SizedBox(
                    width: 10,
                    height: 10,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      color: squareartNeutral.v0,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ));
  }
}
