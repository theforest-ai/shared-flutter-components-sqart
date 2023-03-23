import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:shared_flutter_components_sqart/constants/color.constant.dart';
import 'package:shared_flutter_components_sqart/constants/styles.constant.dart';

class DropdownInput extends StatelessWidget {
  final List<String>? data;
  final void Function(String?)? callback;
  final String? initialValue;
  final String? labelText;
  final bool useCustomWidget;
  final Color? borderColor;
  final Widget Function(String val)? customWidget;

  const DropdownInput(
      {Key? key,
      required this.data,
      required this.callback,
      required this.labelText,
      this.customWidget,
      this.borderColor,
      this.useCustomWidget = false,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: InputDecorator(
        decoration: InputDecoration(
            label: labelText == ""
                ? null
                : Text(
                    labelText!,
                    overflow: TextOverflow.ellipsis,
                    style: normalText(squareartNeutral.v80),
                  ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(color: borderColor ?? squareartNeutral.v40, style: BorderStyle.solid))),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Text(
              labelText!,
              style: hintStyle(),
            ),
            value: initialValue ?? "",
            onChanged: callback,
            items: data!.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: useCustomWidget
                    ? customWidget!(value)
                    : customText(value, 14, FontWeight.w500, Colors.black, maxLine: 4, overflow: TextOverflow.ellipsis),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
