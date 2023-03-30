import 'package:flutter/material.dart';
import 'package:shared_flutter_components_sqart/constants/color.constant.dart';
import 'package:shared_flutter_components_sqart/constants/styles.constant.dart';

class UnfilledIconButton extends StatelessWidget {
  final String? buttonText;
  final IconData? icon;
  final GestureTapCallback? onPressed;
  final bool? isDisabled;
  final Color? iconColor;
  final Color? textColor;
  final Widget? suffixWidget;
  final double? borderWidth;
  final Color? borderColor;
  final bool? isAuthButton;
  final FontWeight? fontWeight;
  const UnfilledIconButton({
    Key? key,
    required this.buttonText,
    required this.icon,
    this.iconColor,
    this.textColor,
    this.borderWidth,
    this.borderColor,
    this.suffixWidget,
    required this.onPressed,
    this.fontWeight,
    required this.isDisabled,
    this.isAuthButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled! ? null : onPressed,
      style: ElevatedButton.styleFrom(
        primary: squareartNeutral.v0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: borderColor ?? squareartNeutral.v100, width: borderWidth ?? 1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor ?? squareartNeutral.v100,
          ),
          horizontalXSmallSpace,
          isAuthButton ?? false
              ? customText(buttonText!, 14, fontWeight??FontWeight.w600, squareArtPrimary.v120)
              : Text(buttonText!, maxLines: 1, style: normalText(textColor ?? squareartNeutral.v100)),
          horizontalXSmallSpace,
          if (suffixWidget != null) suffixWidget!
        ],
      ),
    );
  }
}
