import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';
import 'package:shared-flutter-components-sqart/constants/styles.constant.dart';

import '../loading/loading.dart';
import 'input_card_formatter.dart';

class StandardTextInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final FocusNode? focusNode;
  final double? width;
  final double? height;
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
  final bool? showError;
  final Function()? ontap;
  final Function()? ontapIcon;
  final bool? denySpace;
  final Color? iconColor;
  final bool? forceCaps;
  final bool? hideBorder;
  final TextCapitalization? textCapitalization;
  final TextAlign? textAlign;

  const StandardTextInput({
    Key? key,
    this.labelText,
    this.hintText,
    this.focusNode,
    this.width,
    this.height,
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
    this.showError,
    this.ontap,
    this.ontapIcon,
    this.denySpace,
    this.iconColor,
    this.forceCaps,
    this.hideBorder,
    this.textAlign,
    this.textCapitalization,
  }) : super(key: key);

  @override
  State<StandardTextInput> createState() => _StandardTextInputState();
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}

class _StandardTextInputState extends State<StandardTextInput> {
  bool isFieldEmpty = false;
  bool isLoading = false;

  List<TextInputFormatter> formatted = [];
  @override
  Widget build(BuildContext context) {
    formatted.add(LengthLimitingTextInputFormatter(widget.maxInput != 0 ? widget.maxInput : 100));
    if (widget.denySpace ?? false) {
      formatted.add(FilteringTextInputFormatter.deny(RegExp(r'\s')));
    }
    if (widget.isCard ?? false) {
      formatted.add(CardFormatter(separator: "-"));
    }
    if (widget.forceCaps ?? false) {
      formatted.add(UpperCaseTextFormatter());
    }
    return SizedBox(
      height: widget.height ?? 40,
      width: widget.width,
      child: TextFormField(
        onTap: widget.ontap ?? () {},
        textAlign: widget.textAlign ?? TextAlign.start,
        validator: widget.validator == null ? null : widget.validator!,
        enabled: widget.isDisabled == null ? true : !widget.isDisabled!,
        keyboardType: widget.type,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
        controller: widget.controller,
        inputFormatters: formatted,
        obscureText: false,
        textInputAction: TextInputAction.done,
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
        onFieldSubmitted: (val) {
          if (widget.onSubmitted != null) {
            widget.onSubmitted!(val);
          }
        },
        focusNode: widget.focusNode,
        maxLines: widget.maxLines,
        decoration: widget.icon != null || widget.info != null
            ? InputDecoration(
                suffixIcon: isLoading
                    ? SizedBox(height: 6, width: 10, child: loadingPulse(40, indicatorColor: squareArtPrimary.v60))
                    : widget.iconAlign == "right"
                        ? widget.info != null
                            ? null
                            : InkWell(
                                onTap: () async {
                                  if (widget.ontapIcon != null) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    await widget.ontapIcon!();
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                },
                                child: Icon(
                                  widget.icon ?? Icons.search,
                                  color: widget.iconColor ?? squareartNeutral.v80,
                                  size: 20,
                                ))
                        : null,
                prefixIcon: widget.iconAlign == "left"
                    ? Icon(
                        widget.icon ?? Icons.search,
                        color: squareartNeutral.v80,
                        size: 18,
                      )
                    : null,
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: widget.hideBorder ?? false ? BorderSide.none : BorderSide(color: squareartNeutral.v40),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderSide: widget.hideBorder ?? false ? BorderSide.none : const BorderSide(color: squareartSecondary100),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelStyle: TextStyle(color: squareartNeutral.v80, fontSize: 13),
                hintText: widget.hintText,
                hintStyle: hintStyle(),
                focusedBorder: OutlineInputBorder(
                    borderSide: widget.hideBorder ?? false ? BorderSide.none : const BorderSide(color: squareartSecondary100)),
                errorText: widget.showError == null && isFieldEmpty
                    ? 'Field cannot be empty.'
                    : widget.showError != null && widget.showError!
                        ? isFieldEmpty
                            ? 'Field cannot be empty.'
                            : null
                        : null,
              )
            : InputDecoration(
                filled: widget.isDisabled != null && widget.isDisabled! ? true : false,
                fillColor: widget.isDisabled != null && widget.isDisabled! ? squareartNeutral.v30 : null,
                alignLabelWithHint: true,
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: widget.hideBorder ?? false ? BorderSide.none : BorderSide(color: squareartNeutral.v40),
                  borderRadius: widget.radius == null ? BorderRadius.circular(8) : BorderRadius.circular(widget.radius!),
                ),
                border: OutlineInputBorder(
                  borderSide: widget.hideBorder ?? false ? BorderSide.none : BorderSide(color: squareartNeutral.v40),
                  borderRadius: widget.radius == null ? BorderRadius.circular(8) : BorderRadius.circular(widget.radius!),
                ),
                labelText: widget.labelText,
                labelStyle: TextStyle(color: squareartNeutral.v80, fontSize: 13),
                hintText: widget.hintText,
                hintStyle: hintStyle(),
                focusedBorder: OutlineInputBorder(
                    borderSide: widget.hideBorder ?? false ? BorderSide.none : const BorderSide(color: squareartSecondary100)),
                errorText: widget.showError == null && isFieldEmpty ? 'Field cannot be empty.' : null,
              ),
      ),
    );
  }
}
