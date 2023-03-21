// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;

  const SkeletonWidget._({Key? key, this.width = double.infinity, this.height = double.infinity, this.radius = 0})
      : super(key: key);

  const SkeletonWidget.square({Key? key, double? width, double? height}) : this._(width: width, height: height);

  const SkeletonWidget.rounded({Key? key, double? width, double? height, double radius = 10})
      : this._(width: width, height: height, radius: radius);

  @override
  Widget build(BuildContext context) => SkeletonAnimation(
          child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(color: Colors.grey[300]),
        ),
      ));
}
