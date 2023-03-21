import 'package:flutter/material.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';
import 'package:shared-flutter-components-sqart/constants/styles.constant.dart';

class TextInputCustom extends StatefulWidget {
  final String? labelText;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final Function()? onFocusChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function? iconCallback;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final bool useIcon;
  final TextInputType? keyboardInputType;
  final bool? isObscured;
  final bool? showCursor;
  final Widget? prefix;
  final InputBorder? focusedBorder;

  const TextInputCustom(
      {Key? key,
      this.labelText,
      this.controller,
      this.isObscured = false,
      required this.useIcon,
      this.onSubmit,
      this.onChange,
      this.onFocusChanged,
      this.focusNode,
      this.iconCallback,
      this.showCursor = true,
      this.icon,
      this.backgroundColor,
      this.textColor,
      this.focusedBorder,
      this.prefix,
      this.iconColor,
      this.keyboardInputType})
      : super(key: key);

  @override
  State<TextInputCustom> createState() => _TextInputCustomState();
}

class _TextInputCustomState extends State<TextInputCustom> {
  @override
  void initState() {
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(() {
        if (!widget.focusNode!.hasFocus) {
          if (widget.onFocusChanged != null) {
            widget.onFocusChanged!();
          }
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        showCursor: widget.showCursor,
        textAlign: TextAlign.start,
        style: TextStyle(color: widget.textColor ?? squareArtPrimary.v0),
        enabled: true,
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardInputType ?? TextInputType.text,
        controller: widget.controller,
        obscureText: widget.isObscured ?? false,
        onChanged: widget.onChange ?? (v) {},
        decoration: InputDecoration(
          prefix: widget.prefix,
          focusColor: squareArtSecondary.v100,
          focusedBorder: widget.focusedBorder ??
              OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: squareArtSecondary.v100)),
          filled: true,
          fillColor: widget.backgroundColor ?? Colors.transparent,
          suffixIcon: GestureDetector(
            onTap: () {
              widget.iconCallback!();
            },
            child: Icon(
              widget.icon ?? Icons.search,
              color: widget.useIcon ? widget.iconColor ?? squareArtPrimary.v50 : Colors.transparent,
              size: 20,
            ),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: squareArtPrimary.v40, width: 1)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: squareArtPrimary.v40, width: 1)),
          labelStyle: TextStyle(color: widget.textColor ?? squareArtPrimary.v50, fontSize: 12),
          labelText: widget.labelText,
          hintStyle: hintStyle(),
        ),
      ),
    );
  }
}
