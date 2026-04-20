import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/core/typography/color_extension.dart';

class FormFieldDecoration {
  static InputBorder getFocusedBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: context.applyAppColor(palette: ColorPalette.detail),
        width: 1,
      ),
    );
  }

  static InputBorder getErrorBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: context.applyAppColor(palette: ColorPalette.error),
        width: 1,
      ),
    );
  }

  static InputBorder getEnabledBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: context.applyAppColor(palette: ColorPalette.detail),
        width: 1,
      ),
    );
  }

  static InputBorder getBoarder() {
    return UnderlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
