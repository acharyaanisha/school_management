import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double elevation;
  final bool pinned;
  final bool floating;

  final double? expandedHeight;
  final String? expandedTitle;
  final Widget? expandedContent;

  const CustomSliverAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.elevation = 0,
    this.pinned = true,
    this.floating = false,
    this.expandedHeight,
    this.expandedTitle,
    this.expandedContent,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      floating: floating,
      elevation: elevation,
      expandedHeight: expandedHeight,
      backgroundColor:
          backgroundColor ??
          context.applyAppColor(palette: ColorPalette.primary),
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,

      title: Text(
        title,
        style: context.textStyle(palette: ColorPalette.white).bold.header4,
      ),

      flexibleSpace:
          expandedHeight != null &&
                  (expandedTitle != null || expandedContent != null)
              ? FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: SafeArea(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child:
                        expandedContent ??
                        Text(
                          expandedTitle ?? '',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(color: Colors.white),
                        ),
                  ),
                ),
              )
              : null,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
      ),
    );
  }
}
