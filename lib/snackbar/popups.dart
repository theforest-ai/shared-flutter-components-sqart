import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';
import 'package:shared-flutter-components-sqart/constants/styles.constant.dart';

Widget signupSuccessPopup() {
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalLargeSpace,
        Container(
            height: 160,
            width: Get.width * .5,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: squareartNeutral.v50,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            )),
        verticalLargeSpace,
        customText(translate('Signup.WelcomeToTreasure'), 20, FontWeight.w700, squareartNeutral.v100),
        verticalMediumSpace,
        customText(translate('Signup.WhatDoYouLikeToCollect'), 14, FontWeight.w400, squareartNeutral.v80),
      ],
    ),
  );
}
