// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';
import 'package:shared-flutter-components-sqart/constants/styles.constant.dart';

class TextInputWithIcon extends StatelessWidget {
  final String? labelText;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Color? focusColor;
  double? height = 40;

  TextInputWithIcon({
    Key? key,
    this.labelText,
    this.controller,
    this.onSubmit,
    this.onChange,
    this.focusColor,
    this.height = 40,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        enabled: true,
        focusNode: focusNode,
        keyboardType: TextInputType.text,
        controller: controller,
        obscureText: false,
        onChanged: (val) {
          if (onChange != null) {
            onChange!(val);
          }
        },
        onFieldSubmitted: onSubmit,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: squareartNeutral.v80,
            size: 20,
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: focusColor ?? squareArtSecondary.v100)),
          focusColor: squareArtSecondary.v100,
          labelText: labelText,
          labelStyle: TextStyle(color: squareartNeutral.v80, fontSize: 13),
          hintText: labelText,
          hintStyle: hintStyle(),
        ),
      ),
    );
  }
}
