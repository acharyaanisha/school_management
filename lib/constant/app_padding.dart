import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding {
  static EdgeInsets basePagePadding = EdgeInsets.only(
    left: 16.w,
    bottom: 16.h,
    top: 16.h,
    right: 16.w,
  );

  static EdgeInsets customButtonPadding = EdgeInsets.only(bottom: 20.h);

  static const EdgeInsets formFieldLabelPadding = EdgeInsets.only(bottom: 5);

  static const EdgeInsets listTilePadding = EdgeInsets.only(left: 8, right: 8);

  static EdgeInsets onlyLeftPading = EdgeInsets.only(left: 4);

  static EdgeInsets onlyRightPading = EdgeInsets.only(right: 8);

  static EdgeInsets onlyBottomPading = EdgeInsets.only(bottom: 12.h);

  static EdgeInsets onlyTopPading = EdgeInsets.only(top: 8);

  static EdgeInsets contentPadding = EdgeInsets.symmetric(
    horizontal: 12.w,
    vertical: 8.h,
  );
}
