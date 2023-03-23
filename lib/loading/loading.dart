// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:shared_flutter_components_sqart/constants/color.constant.dart';

Widget buildLoading(BuildContext context) {
  return Container(
    height: Get.height * .8,
    color: Colors.white.withOpacity(.8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
            child: CircularProgressIndicator(
          color: Colors.black,
        )),
      ],
    ),
  );
}

Widget loadingPulse(double size, {Color? indicatorColor}) {
  return SpinKitPulse(color: indicatorColor ?? squareArtSecondary.v100, size: size, duration: const Duration(milliseconds: 800));
}

class SkeletonContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;

  const SkeletonContainer._({Key? key, this.width = double.infinity, this.height = double.infinity, this.radius = 0}) : super(key: key);

  const SkeletonContainer.square({Key? key, double? width, double? height}) : this._(width: width, height: height);

  const SkeletonContainer.rounded({Key? key, double? width, double? height, double? radius = 10})
      : this._(width: width, height: height, radius: radius);

  @override
  Widget build(BuildContext context) => SkeletonAnimation(
          child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius!),
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(color: Colors.grey[300]),
        ),
      ));
}
