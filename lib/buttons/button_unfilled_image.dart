import 'package:flutter/material.dart';
import 'package:shared_flutter_components_sqart/constants/color.constant.dart';
import 'package:shared_flutter_components_sqart/constants/styles.constant.dart';

class UnfilledImageButton extends StatelessWidget {
  final String? buttonText;
  final Image? image;
  final GestureTapCallback? onPressed;
  final bool? isDisabled;
  final Color? textColor;
  final bool? isAuthButton;
  final bool? isRobotoFont;
  final String? img;
  final double? widthImg;
  const UnfilledImageButton({
    Key? key,
    required this.buttonText,
    required this.image,
    required this.onPressed,
    required this.isDisabled,
    this.textColor,
    this.isAuthButton,
    this.isRobotoFont,
    this.img,
    this.widthImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled! ? null : onPressed,
      style: ElevatedButton.styleFrom(
        primary: squareartNeutral.v0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: textColor != null ? textColor! : squareartNeutral.v100, width: 1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image!,
          horizontalXSmallSpace,
          isAuthButton ?? false
              ? isRobotoFont ?? false
                  ? customTextRoboto(buttonText!, 14, FontWeight.w600, textColor ?? squareartNeutral.v100)
                  : customText(buttonText!, 14, FontWeight.w600, textColor ?? squareartNeutral.v100)
              : Text(buttonText!, maxLines: 1, style: normalText(textColor != null ? textColor! : squareartNeutral.v100)),
        ],
      ),
    );
  }
}
