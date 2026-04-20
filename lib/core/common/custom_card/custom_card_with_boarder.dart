import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/core/typography/color_extension.dart';

class CustomCardWithBoarder extends StatelessWidget {
  final Color? borderColor;
  final Color? color;
  final Widget? child;
  final double? borderRadius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CustomCardWithBoarder({
    super.key,
    this.borderColor,
    this.color,
    this.height,
    this.width,
    required this.child,
    this.borderRadius,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? AppColor.whiteColor,
        border: Border.all(
          color:
              borderColor ??
              context.applyAppColor(palette: ColorPalette.detail, swatch: 300),
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
      ),
      child: Padding(padding: const EdgeInsets.all(10.0), child: child),
    );
  }
}
