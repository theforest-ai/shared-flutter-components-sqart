import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';

import '../../constants/styles.constant.dart';

showCustomSnackbar(
    {String? upperTitle,
    String? title,
    required String subtitle,
    bool isError = false,
    bool isRichText = false,
    RichText? richText,
    Widget? rightIcon,
    Duration duration = const Duration(seconds: 3)}) {
  final Color background = squareartNeutral.v0;
  final Color fill = isError ? squareArtActionRedDark : squareArtActionGreen;
  final List<Color> gradient = [
    background,
    background,
    fill,
    fill,
  ];
  const double fillPercent = 8;
  const double fillStop = (100 - fillPercent) / 100;
  final List<double> stops = [0.0, fillStop, fillStop, 1.0];
  Get.snackbar("", "",
      duration: duration,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      maxWidth: 600,
      titleText: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: customText(upperTitle ?? "Success", 14, FontWeight.w600, squareArtPrimary.v100, maxLine: 3),
            ),
            if (rightIcon != null) rightIcon
          ],
        ),
      ),
      messageText: ClipRect(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              width: Get.width,
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: gradient,
                  stops: stops,
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                ),
              ),
              child: isRichText
                  ? richText ??
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(children: [
                          TextSpan(text: title ?? "", style: normalText(squareartNeutral.v80)),
                          TextSpan(text: subtitle, style: normalTextBold(squareartNeutral.v80))
                        ]),
                      )
                  : customText(subtitle, 12, FontWeight.normal, squareartNeutral.v80, maxLine: 5),
            ),
          ],
        ),
      ),
      snackPosition: SnackPosition.TOP,
      boxShadows: [BoxShadow(color: squareArtPrimary.v30, offset: const Offset(2, 5), spreadRadius: 2, blurRadius: 10)],
      borderRadius: 12,
      backgroundColor: squareartNeutral.v0);
}
