import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared-flutter-components-sqart/constants/color.constant.dart';

class PhotoInput extends StatelessWidget {
  final Function()? callback;
  final Uint8List? imageMemory;
  final AssetImage? currentImage;
  const PhotoInput({Key? key, required this.callback, required this.imageMemory, required this.currentImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: squareArtPrimary.v0,
      backgroundImage:
          (imageMemory!.isEmpty ? const AssetImage("assets/icons/Ellipse 267.png") : MemoryImage(imageMemory!)) as ImageProvider<Object>?,
      radius: 35,
      child: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: callback,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: squareartNeutral.v40,
              child: Icon(
                Icons.camera_alt,
                color: squareartNeutral.v80,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
