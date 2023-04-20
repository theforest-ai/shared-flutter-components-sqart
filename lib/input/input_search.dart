import 'package:flutter/material.dart';
import 'package:shared_flutter_components_sqart/constants/color.constant.dart';
class SearchInput extends StatefulWidget {
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
    this.cursorColor,
    this.fillColor,
    this.underlineColorOnFocus,
  }) : super(key: key);

  final double? radius;
  final bool? autoFocus;
  final Color? fillColor;
  final Color? underlineColorOnFocus;
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
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: widget.height ?? 50,
        child: Stack(
          children: [
            FocusScope(
              onFocusChange: (focus) {
                if (widget.underlineColorOnFocus != null) {
                  setState(() {});
                }
              },
              child: TextFormField(
                onTap: widget.onTap ?? () {},
                autofocus: widget.autoFocus ?? false,
                onFieldSubmitted: widget.onSubmit,
                onChanged: widget.onChanged ?? (v) {},
                controller: widget.controller,
                focusNode: widget.focusNode,
                cursorColor: widget.cursorColor,
                decoration: InputDecoration(
                  fillColor: widget.fillColor,
                  filled: widget.fillColor != null,
                  contentPadding: const EdgeInsets.all(0),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 5.0)),
                      borderSide: BorderSide(color: squareartNeutral.v100)),
                  enabledBorder: OutlineInputBorder(
                    gapPadding: .5,
                    borderSide: BorderSide(width: 2, color: squareartNeutral.v30),
                    borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 8.0)),
                  ),
                  hintText: widget.placeholder,
                  prefixIcon: Icon(
                    Icons.search,
                    size: widget.height == null ? 26 : 20,
                    color: squareartNeutral.v80,
                  ),
                  suffixIcon: widget.showRemoveIcon == null || widget.showRemoveIcon!
                      ? GestureDetector(
                          onTap: widget.onRemoveText ?? () {},
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
            ),
            if (widget.focusNode.hasFocus && widget.underlineColorOnFocus != null)
              Positioned(
                bottom: 0,
                left: 2,
                right: 2,
                child: SizedBox(
                  width: constraints.maxWidth * .9,
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: widget.underlineColorOnFocus,
                    ),
                  ),
                ),
              )
          ],
        ),
      );
    });
  }
}