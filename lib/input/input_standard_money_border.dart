// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:shared_flutter_components_sqart/constants/color.constant.dart';
import 'package:shared_flutter_components_sqart/constants/styles.constant.dart';

class StandardMoneyBorderInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final FocusNode? focusNode;
  final double? width;
  final TextInputType? type;
  final bool? isDisabled;
  final bool? isCard;
  final TextEditingController? controller;
  final int? maxLines;
  final IconData? icon;
  final String? info;
  final String? iconAlign;
  final double? radius;
  final int? maxInput;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  bool showError;
  final Color? prefixIconColor;
  final Widget? suffix;

  StandardMoneyBorderInput({
    Key? key,
    this.labelText,
    this.hintText,
    this.showError = true,
    this.focusNode,
    this.width,
    this.type,
    this.isDisabled,
    this.isCard,
    this.controller,
    this.icon,
    this.info,
    this.iconAlign,
    this.maxLines,
    this.onChanged,
    this.onSubmitted,
    this.radius,
    this.maxInput,
    this.prefixIconColor,
    this.suffix
  }) : super(key: key);

  @override
  State<StandardMoneyBorderInput> createState() => _StandardMoneyBorderInputState();
}

class _StandardMoneyBorderInputState extends State<StandardMoneyBorderInput> {
  bool isFieldEmpty = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextField(
        enabled: widget.isDisabled == null ? true : !widget.isDisabled!,
        keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
        controller: widget.controller,
        inputFormatters: [ThousandsFormatter(allowFraction: true)],
        obscureText: false,
        onChanged: (val) {
          if (widget.controller?.text == "0") {
            widget.controller?.text = "";
          }
          if (widget.onChanged != null) {
            widget.onChanged!(val);
          }
          setState(() {
            isFieldEmpty = val.isEmpty;
          });
        },
        onSubmitted: (val) {
          if (widget.onSubmitted != null) {
            widget.onSubmitted!(val);
          }
        },
        focusNode: widget.focusNode,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: squareartNeutral.v40),
          ),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: squareArtSecondary.v100)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: squareartNeutral.v40),
            borderRadius: widget.radius == null ? BorderRadius.circular(8) : BorderRadius.circular(widget.radius!),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: squareartNeutral.v80, fontSize: 13),
          hintText: widget.hintText,
          hintStyle: hintStyle(),
          suffix: widget.suffix,
          prefixIcon: Icon(
            Icons.attach_money,
            color: widget.prefixIconColor??squareArtSecondary.v100,
          ),
          errorText: isFieldEmpty && widget.showError ? 'Field cannot be empty.' : null,
        ),
      ),
    );
  }
}
