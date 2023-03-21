import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  CustomText(this.text, this.size, this.weight, this.color, {this.overflow, this.textAlign, this.maxLine});

  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text,
            textAlign: textAlign ?? TextAlign.start,
            maxLines: maxLine ?? 1,
            style:  GoogleFonts.lato(
          textStyle: TextStyle(fontWeight: weight, fontSize: size, color: color, overflow: overflow ?? TextOverflow.ellipsis))),
      ],
    );
  }
}

class ClickableText extends StatelessWidget {
  final GestureTapCallback callback;
  final String text;
  final FontWeight weight;
  final double size;
  final Color color;
  const ClickableText({
    Key? key,
    required this.callback,
    required this.text,
    required this.weight,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        key: key,
        onTap: callback,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: CustomText(text, size, weight, color));
  }
}
