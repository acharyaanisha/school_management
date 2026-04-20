import 'package:flutter/material.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';

class BottomDialog {
  static Future<void> showBottomDialog({
    required BuildContext context,
    required Widget child,
    String? title = "",
  }) {
    return showModalBottomSheet<void>(
      enableDrag: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext popContext) {
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 0),
          curve: Curves.decelerate,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != "")
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      title!,
                      style:
                          context
                              .textStyle(palette: ColorPalette.primary)
                              .large
                              .semiBold,
                    ),
                  ),
                ),
              child,
            ],
          ),
        );
      },
    );
  }
}
