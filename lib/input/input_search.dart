import 'package:flutter/material.dart';
import 'package:shared_flutter_components_sqart/constants/color.constant.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.placeholder,
    this.radius,
    this.showRemoveIcon,
    this.height,
    this.onRemoveText,
    this.autoFocus,
    required this.onSubmit,
    this.onChanged,
    this.onTap,
    this.cursorColor
  }) : super(key: key);

  final double? radius;
  final bool? autoFocus;
  final bool? showRemoveIcon;
  final double? height;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String placeholder;
  final Function(String) onSubmit;
  final Function()? onRemoveText;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Color? cursorColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      child: TextFormField(
        onTap: onTap ?? () {},
        autofocus: autoFocus ?? false,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged ?? (v) {},
        controller: controller,
        focusNode: focusNode,
        cursorColor: cursorColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 5.0)), borderSide: BorderSide(color: squareartNeutral.v100)),
          enabledBorder: OutlineInputBorder(
              gapPadding: .5,
              borderSide: BorderSide(width: 2, color: squareartNeutral.v30),
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 8.0))),
          hintText: placeholder,
          prefixIcon: Icon(
            Icons.search,
            size: height == null ? 26 : 20,
            color: squareartNeutral.v80,
          ),
          suffixIcon: showRemoveIcon == null || showRemoveIcon!
              ? GestureDetector(
                  onTap: onRemoveText ?? () {},
                  child: Icon(
                    Icons.close,
                    size: 16,
                    color: squareartNeutral.v80,
                  ))
              : null,
          hintStyle: TextStyle(
            color: squareartNeutral.v80,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
