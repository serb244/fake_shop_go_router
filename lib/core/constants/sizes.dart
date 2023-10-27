import 'package:flutter/material.dart';

abstract class Sizes {
  // AppBar
  // AppBarSmall
  static const double appbarSmallTitleWidth = 158;
  static const int appbarSmallTitleMaxLines = 2;
  static const double appbarSmallHeight = 44.0;
  static const double appbarSmallLeadingWidth = 100.0;
  // All
  static const double sizedBoxWidthNormal = 8.0;
  static const double bodyPadding = 16.0;
  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 8.0;
}

ShapeBorder get shapeMedium => RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    );
