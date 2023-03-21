import 'package:flutter/material.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';

Widget Function(BuildContext, Object, StackTrace?)? handleFlagImageError({required String? country}) {
  if (country != "") {
    return (context, exception, stackTrace) {
      return Image.asset(
        'assets/images/flags/$country.png',
        width: 20,
      );
    };
  }
  return (context, exception, stackTrace) {
    return const Icon(
      Icons.broken_image_outlined,
      size: 30,
    );
  };
}

Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder({double? width, double? height}) {
  return (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return SizedBox(
      child: Center(
        child: CircularProgressIndicator(
          color: squareartSecondary100,
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
              : null,
        ),
      ),
    );
  };
}

Widget Function(BuildContext, Object, StackTrace?)? handleImageError({double? width}) {
  return (context, exception, stackTrace) {
    return Center(
      child: SizedBox(
        width: width ?? 60,
        child: const Icon(
          Icons.error,
        ),
      ),
    );
  };
}
