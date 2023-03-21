import 'package:flutter/material.dart';

class CustomSpace {
  static Widget verticalSmall = SizedBox(height: 10);
  static Widget verticalMedium = SizedBox(height: 15);
  static Widget verticalLarge = SizedBox(height: 20);
  static Widget verticalXL = SizedBox(height: 30);
  static Widget verticalXXL = SizedBox(height: 50);
  static Widget Function(double height) vertical = (double val) => SizedBox(height: val);

  static Widget horizontalSmall = SizedBox(width: 10);
  static Widget horizontalMedium = SizedBox(width: 15);
  static Widget horizontalLarge = SizedBox(width: 20);
  static Widget horizontalXL = SizedBox(width: 30);
  static Widget horizontalXXL = SizedBox(width: 50);
  static Widget Function(double width) horizontal = (double val) => SizedBox(width: val);

}
