import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';
import 'package:shared-flutter-components-sqart/constants/styles.constant.dart';

import 'input_decimal_text_formatter.dart';

class StandardMoneyInput extends StatefulWidget {
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
  final String? Function(String?)? validator;

  const StandardMoneyInput({
    Key? key,
    this.labelText,
    this.hintText,
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
    this.validator,
  }) : super(key: key);

  @override
  State<StandardMoneyInput> createState() => _StandardMoneyInputState();
}

class _StandardMoneyInputState extends State<StandardMoneyInput> {
  bool isFieldEmpty = false;

  List<TextInputFormatter> formatted = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextField(
        enabled: widget.isDisabled == null ? true : !widget.isDisabled!,
        keyboardType: TextInputType.number,
        controller: widget.controller,
        inputFormatters: [
          ThousandsFormatter(
            allowFraction: true,
          ),
          DecimalTextInputFormatter(decimalRange: 2)
        ],
        obscureText: false,
        onChanged: (val) {
          if (val.isEmpty) {
            setState(() {
              isFieldEmpty = true;
            });
          } else {
            setState(() {
              isFieldEmpty = false;
            });
          }
          if (widget.onChanged != null) {
            widget.onChanged!(val);
          }
        },
        onSubmitted: (val) {
          if (widget.onSubmitted != null) {
            widget.onSubmitted!(val);
          }
        },
        focusNode: widget.focusNode,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: squareArtSecondary.v100),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: squareArtSecondary.v100),
          ),
          alignLabelWithHint: true,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          focusColor: squareArtSecondary.v100,
          labelText: widget.labelText,
          labelStyle: TextStyle(color: squareartNeutral.v80, fontSize: 13),
          hintText: widget.hintText,
          hintStyle: hintStyle(),
          prefixIcon: Icon(
            Icons.attach_money,
            color: squareArtSecondary.v100,
          ),
          errorText: isFieldEmpty ? 'Field cannot be empty.' : null,
        ),
      ),
    );
  }
}
