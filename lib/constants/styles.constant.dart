import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';

// Headings
Text headingOne(String text, Color color, {FontWeight? fontWeight}) {
  return Text(text,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20, fontWeight: fontWeight ?? FontWeight.w700, color: color)));
}

Text headingTwo(String text, Color color) {
  return Text(text,
      textDirection: TextDirection.ltr,
      style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: color)));
}

Text subHeading(String text, Color color, TextAlign textAlign) {
  return Text(text,
      textAlign: textAlign,
      textDirection: TextDirection.ltr,
      style: GoogleFonts.lato(textStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: color)));
}

Widget customText(String text, double size, FontWeight weight, Color color,
    {TextOverflow? overflow, TextAlign? textAlign, int? maxLine, bool limitDisplayText = false}) {
  return Text(
      limitDisplayText
          ? text.length > 130
              ? "${text.substring(0, 130)}.."
              : text
          : text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLine ?? 1,
      style: GoogleFonts.lato(
          textStyle: TextStyle(fontWeight: weight, fontSize: size, color: color, overflow: overflow ?? TextOverflow.ellipsis)));
}

Widget customTextRoboto(String text, double size, FontWeight weight, Color color,
    {TextOverflow? overflow, TextAlign? textAlign, int? maxLine}) {
  return Text(text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLine ?? 1,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(fontWeight: weight, fontSize: size, color: color, overflow: overflow ?? TextOverflow.ellipsis)));
}

TextStyle titleStyle = const TextStyle(fontWeight: FontWeight.bold, color: squareartPrimary100, fontSize: 20);
TextStyle subtitleStyle = TextStyle(color: squareartNeutral.v80, fontSize: 16);
TextStyle forgotPasswordStyle = const TextStyle(color: squareartPrimary100, fontSize: 13, fontWeight: FontWeight.bold);

// Text
TextStyle smallTextBold(Color color) {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: color);
}

TextStyle subText(Color color) {
  return TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: color);
}

TextStyle normalTextBold(Color color) {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: color);
}

TextStyle infoText(Color color, {FontWeight? fontWeight}) {
  return TextStyle(fontWeight: fontWeight ?? FontWeight.normal, fontSize: 12, color: color);
}

TextStyle normalText(Color color) {
  return TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: color);
}

TextStyle customTextStyle(
  Color color,
  double size,
  FontWeight weight, {
  Color? backgroundColor,
  TextOverflow? overflow,
}) {
  return TextStyle(
      fontWeight: weight, fontSize: size, color: color, backgroundColor: backgroundColor, overflow: overflow ?? TextOverflow.ellipsis);
}

TextStyle clickableTextStyle(FontWeight weight, double size, Color color) {
  return TextStyle(fontWeight: weight, fontSize: size, color: color);
}

TextStyle hintStyle() {
  return TextStyle(fontSize: 12, color: squareartNeutral.v70);
}

// Spaces

SizedBox verticalXSmallSpace = const SizedBox(height: 5);
SizedBox verticalSmallSpace = const SizedBox(height: 10);
SizedBox verticalMediumSpace = const SizedBox(height: 15);
SizedBox verticalLargeSpace = const SizedBox(height: 20);
SizedBox verticalXLSpace = const SizedBox(height: 30);
SizedBox verticalXXLSpace = const SizedBox(height: 50);
SizedBox verticalXXXLSpace = const SizedBox(height: 70);

SizedBox verticalCustomSpace(double size) {
  return SizedBox(height: size);
}

SizedBox horizontalXSmallSpace = const SizedBox(width: 5);
SizedBox horizontalSmallSpace = const SizedBox(width: 10);
SizedBox horizontalMediumSpace = const SizedBox(width: 15);
SizedBox horizontalLargeSpace = const SizedBox(width: 20);
SizedBox horizontalXLSpace = const SizedBox(width: 30);
SizedBox horizontalXXLSpace = const SizedBox(width: 50);
SizedBox horizontalXXXLSpace = const SizedBox(width: 70);

EdgeInsetsGeometry generalPadding = const EdgeInsets.symmetric(horizontal: 20, vertical: 20);
EdgeInsetsGeometry generalPaddingSmall = const EdgeInsets.symmetric(horizontal: 10, vertical: 10);
EdgeInsetsGeometry generalPaddingXSmall = const EdgeInsets.symmetric(horizontal: 5, vertical: 5);
EdgeInsetsGeometry generalPaddingHorizontal = const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0);
EdgeInsetsGeometry generalPaddingHorizontalSmall = const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0);
EdgeInsetsGeometry generalPaddingVertical = const EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 20);
EdgeInsetsGeometry generalPaddingVerticalSmall = const EdgeInsets.symmetric(vertical: 10);
EdgeInsetsGeometry generalPaddingLeft = const EdgeInsets.only(top: 0, left: 20, right: 0, bottom: 0);

// Shadows
// final BoxShadow normalShadow =
//     BoxShadow(color: MEMBIFI_BLACK.v200, spreadRadius: 2, blurRadius: 2);
