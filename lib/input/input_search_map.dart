import 'package:flutter/material.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';

class SearchMapInput extends StatelessWidget {
  const SearchMapInput(
      {Key? key,
      required this.controller,
      required this.focusNode,
      required this.placeholder,
      this.radius,
      this.height,
      required this.onTap,
      required this.onSubmit})
      : super(key: key);

  final double? radius;
  final double? height;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String placeholder;
  final Function(String) onSubmit;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      child: TextFormField(
        onFieldSubmitted: onSubmit,
        onTap: onTap,
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 5.0)), borderSide: BorderSide(color: squareartNeutral.v100)),
          border: OutlineInputBorder(
              gapPadding: 2.0,
              borderSide: BorderSide(width: 2, color: squareartNeutral.v80),
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 5.0))),
          hintText: placeholder,
          prefixIcon: Icon(
            Icons.search,
            size: height == null ? 26 : 20,
            color: squareartNeutral.v80,
          ),
          hintStyle: TextStyle(
            color: squareartNeutral.v80,
            fontSize: height == null ? 18 : 15,
          ),
        ),
      ),
    );
  }
}
