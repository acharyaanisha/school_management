import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_icons.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? showBackButton;
  // final Widget? child;
  final Widget? leadingWidget;
  final List<Widget>? trailing;
  final double? height;
  final double? elevation;
  final Color? colors;
  final Widget? title;
  final String? navigate;
  final Widget? bottom;
  final Color? appBarColor;
  final bool? centerTitle;

  const CustomAppBar({
    super.key,
    this.title,
    this.showBackButton,
    // this.child,
    this.leadingWidget,
    this.trailing,
    this.height,
    this.elevation,
    this.colors,
    this.navigate,
    this.bottom,
    this.appBarColor,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
      child: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: AppColor.blackColor),
        elevation: elevation ?? 0.5,
        backgroundColor: colors ?? AppColor.primaryColor,
        centerTitle: centerTitle ?? false,
        title: title,
        titleTextStyle: context.textStyle(palette: ColorPalette.white).header4,

        shadowColor: Colors.transparent,
        leading:
            showBackButton == false
                ? leadingWidget
                : Builder(
                  builder:
                      (BuildContext context) => IconButton(
                        onPressed: () {
                          navigate != null
                              ? Navigator.pushNamed(context, navigate!)
                              : WidgetsBinding.instance.addPostFrameCallback((
                                _,
                              ) {
                                Navigator.pop(context);
                              });
                        },
                        icon: leadingWidget ?? AppIcons.arrowBack,
                        color: context.applyAppColor(
                          palette: ColorPalette.white,
                        ),
                      ),
                ),
        actions: trailing ?? [const Text('')],
        bottom:
            bottom == null
                ? null
                : PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: bottom ?? const Text(''),
                ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
