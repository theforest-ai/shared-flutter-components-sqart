// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_flutter_components_sqart/constants/color.constant.dart';
import 'package:shared_flutter_components_sqart/constants/styles.constant.dart';

class FilledButton extends StatefulWidget {
  final String? buttonText;
  final GestureTapCallback? onPressed;
  final bool? isDisabled;
  final bool? roundShape;
  final bool? halfWidth;
  final Color? fillColor;
  final Color? textColor;
  final Color? borderColor;
  final double? fontSize;
  final EdgeInsets? padding;
  final int? maxLine;
  final TextAlign? textAlign;
  bool isOutline;
  bool isDisabledOnPressed;
  final Widget? iconWidget;
  final bool useIconWidget;
  final IconData? icon;
  FilledButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.isDisabled,
    this.roundShape,
    this.halfWidth,
    this.fillColor,
    this.textColor,
    this.fontSize,
    this.borderColor,
    this.padding,
    this.maxLine,
    this.textAlign,
    this.isDisabledOnPressed = false,
    this.isOutline = false,
    this.icon,
    this.iconWidget,
    this.useIconWidget = false,
  }) : super(key: key);

  @override
  State<FilledButton> createState() => _FilledButtonState();
}

class _FilledButtonState extends State<FilledButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.isDisabled! || widget.isDisabledOnPressed
            ? null
            : () async {
                setState(() {
                  widget.isDisabledOnPressed = true;
                });
                await Future.delayed(Duration.zero, () => widget.onPressed!());
                setState(() {
                  widget.isDisabledOnPressed = false;
                });
              }();
      },
      style: ElevatedButton.styleFrom(
          padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          visualDensity: const VisualDensity(vertical: -2, horizontal: 1),
          primary: widget.isDisabledOnPressed || widget.isDisabled! ? squareArtPrimary.v20 : widget.fillColor ?? squareartNeutral.v100,
          side: widget.isOutline
              ? BorderSide(
                  width: 1.0,
                  color: widget.textColor ?? squareartNeutral.v100,
                )
              : BorderSide.none,
          shape: widget.roundShape != null
              ? widget.roundShape!
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )
                  : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
      child: SizedBox(
        width: widget.halfWidth != null
            ? widget.halfWidth!
                ? Get.width * .35
                : null
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.useIconWidget && widget.iconWidget != null
                ? widget.iconWidget!
                : widget.icon == null
                    ? const SizedBox()
                    : Icon(
                        widget.icon,
                        color: widget.textColor ?? squareartNeutral.v0,
                        size: 18,
                      ),
            horizontalXSmallSpace,
            customText(widget.buttonText!, widget.fontSize ?? 16, FontWeight.w400,
                widget.isDisabledOnPressed ? squareArtPrimary.v40 : widget.textColor ?? squareartNeutral.v0,
                maxLine: widget.maxLine ?? 1, textAlign: widget.textAlign ?? TextAlign.start),
          ],
        ),
      ),
    );
  }
}
