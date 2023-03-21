import 'package:flutter/material.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';
import 'package:shared-flutter-components-sqart/constants/styles.constant.dart';

class PasswordInput extends StatelessWidget {
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final FocusNode? focusNode;
  final double? width;
  final bool isObscured;
  final Function(String)? callback;
  final String? Function(String?)? validator;
  final Function()? hidePassword;

  const PasswordInput({
    Key? key,
    required this.initialValue,
    required this.labelText,
    required this.hintText,
    required this.focusNode,
    required this.width,
    required this.isObscured,
    required this.callback,
    required this.hidePassword,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        validator: validator,
        enabled: true,
        keyboardType: TextInputType.text,
        initialValue: initialValue,
        obscureText: isObscured,
        onChanged: callback,
        focusNode: focusNode,
        decoration: InputDecoration(
          errorMaxLines: 4,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: squareartNeutral.v40),
            borderRadius: BorderRadius.circular(8),
          ),
          focusColor: squareArtSecondary.v100,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: squareArtSecondary.v100)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: squareartNeutral.v40),
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: squareartNeutral.v80, fontSize: 13),
          hintText: hintText,
          hintStyle: hintStyle(),
          suffixIcon: IconButton(
            icon: Icon(
              isObscured ? Icons.visibility_off : Icons.visibility,
              color: squareartNeutral.v80,
              size: 16,
            ),
            onPressed: hidePassword,
          ),
        ),
      ),
    );
  }
}
