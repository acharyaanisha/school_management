import 'package:flutter/material.dart';
import 'package:school_management/constant/app_colors.dart';

extension MaterialColorExtensions on BuildContext {
  //color
  Color applyAppColor({required MaterialColor palette, int swatch = 500}) =>
      palette[swatch] ?? AppColor.primaryColor;

  /// Creates a TextStyle with a color from the specified palette and swatch value.
  TextStyle textStyle({required MaterialColor palette, int swatch = 500}) =>
      TextStyle(color: applyAppColor(palette: palette, swatch: swatch));
  TextStyle textBlackStyle() => TextStyle(color: AppColor.primaryColor);
  TextStyle textStyleWithColor(Color color) => TextStyle(color: color);
}
