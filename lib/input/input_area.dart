// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';
import 'package:shared-flutter-components-sqart/constants/styles.constant.dart';

class TextAreaInput extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final FocusNode? focusNode;
  final double? width;
  final TextInputType? type;
  final bool? isDisabled;
  final TextEditingController? controller;
  int? maxLines = 1;
  final IconData? icon;
  final String? info;
  final String? iconAlign;
  Function(String)? onChanged;
  Function(String)? onSubmitted;
  Color? borderColor;

  TextAreaInput({
    Key? key,
    this.labelText,
    this.hintText,
    this.focusNode,
    this.width,
    this.type,
    this.isDisabled,
    this.controller,
    this.maxLines,
    this.icon,
    this.info,
    this.iconAlign,
    this.onChanged,
    this.borderColor,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        enabled: true,
        keyboardType: TextInputType.text,
        controller: controller,
        obscureText: false,
        onChanged: (val) {
          if (onChanged != null) {
            onChanged!(val);
          }
        },
        focusNode: focusNode,
        maxLines: maxLines,
        decoration: icon != null || info != null
            ? InputDecoration(
                alignLabelWithHint: true,
                suffixText: info != null && iconAlign == "right" ? info : null,
                suffixIcon: iconAlign == "right"
                    ? info != null
                        ? null
                        : Icon(
                            icon ?? Icons.search,
                            color: squareartNeutral.v80,
                            size: 18,
                          )
                    : null,
                prefixText: info != null && iconAlign == "left" ? info : null,
                prefixIcon: iconAlign == "left"
                    ? info != null
                        ? null
                        : Icon(
                            icon ?? Icons.search,
                            color: squareartNeutral.v80,
                            size: 18,
                          )
                    : null,
                fillColor: squareartPrimary100,
                hoverColor: squareartPrimary100,
                focusColor: squareartPrimary100,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: borderColor ?? squareartNeutral.v40)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: borderColor ?? squareartNeutral.v40)),
                labelText: labelText,
                labelStyle: TextStyle(color: squareartNeutral.v80, fontSize: 13),
                hintText: hintText,
                hintStyle: hintStyle(),
              )
            : InputDecoration(
                alignLabelWithHint: true,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: borderColor ?? squareartNeutral.v40)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: borderColor ?? squareartNeutral.v40)),
                labelText: labelText,
                fillColor: squareartPrimary100,
                hoverColor: squareartPrimary100,
                focusColor: squareartPrimary100,
                labelStyle: TextStyle(color: squareartNeutral.v80, fontSize: 13),
                hintText: hintText,
                hintStyle: hintStyle(),
              ),
      ),
    );
  }
}
