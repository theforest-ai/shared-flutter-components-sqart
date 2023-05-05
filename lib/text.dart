import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  CustomText(this.text, this.size, this.weight, this.color,
      {this.overflow, this.textAlign, this.maxLine, this.letterSpacing, this.lineHeight, this.decoration, this.fontStyle});

  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLine;
  final double? letterSpacing;
  final double? lineHeight;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Text(text,
            textAlign: textAlign ?? TextAlign.start,
            maxLines: maxLine ?? 1,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    letterSpacing: letterSpacing,
                    height: lineHeight,
                    fontWeight: weight,
                    fontSize: size,
                    fontStyle: fontStyle ?? FontStyle.normal,
                    color: color,
                    decoration: decoration,
                    overflow: overflow ?? TextOverflow.ellipsis)));
  }
}

class ClickableText extends StatelessWidget {
  final GestureTapCallback callback;
  final String? text;
  final FontWeight? weight;
  final double? size;
  final Color? color;
  final FontStyle? fontStyle;
  final CustomText? customText;
  const ClickableText({Key? key, required this.callback, this.text, this.weight, this.size, this.color, this.fontStyle, this.customText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (customText == null) {
      assert(text != null);
      assert(size != null);
      assert(color != null);
      assert(weight != null);
    }

    return InkWell(
        key: key,
        onTap: callback,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: customText ??
            CustomText(
              text!,
              size!,
              weight!,
              color!,
              fontStyle: fontStyle,
            ));
  }
}
