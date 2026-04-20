import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_padding.dart';
// import 'package:school_management/constant/res_string.dart';
import 'package:school_management/core/common/custom_button/custom_button.dart';
// import 'package:school_management/core/localization/get_localization_string.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';
import 'package:school_management/feature/authentication/login/login_screen.dart';

class LogoutPopup {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.2),
      builder: (BuildContext context) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(),
            ),
            const LogoutScreen(),
          ],
        );
      },
    );
  }
}

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  bool canPop = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (bool value, dynamic val) {
        setState(() {
          canPop = !value;
        });

        if (canPop) {
          // showAppExistSnackBar(context);
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: const EdgeInsets.all(20),
        child: Container(
          width: double.maxFinite,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: AppPadding.basePagePadding,
            child: buildLogoutBox(),
          ),
        ),
      ),
    );
  }

  Column buildLogoutBox() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Logout",
                    // getLocalizedString(
                    //   context: context,
                    //   resString: ResString.logout,
                    // ),
                    style:
                        context
                            .textStyle(palette: ColorPalette.primary)
                            .header4
                            .semiBold,
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      MdiIcons.closeCircle,
                      color: context.applyAppColor(
                        palette: ColorPalette.detail,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
              Text(
                "Are you sure you want to logout?",
                // getLocalizedString(
                //   context: context,
                //   resString: ResString.sureWantLogout,
                // ),
                style: context.textStyle(palette: ColorPalette.detail).small,
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: CustomTextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      labelStyle:
                          context
                              .textStyle(palette: ColorPalette.error)
                              .xsmall
                              .semiBold,
                      buttonPadding: EdgeInsets.zero,
                      label: "Cancel",
                      // getLocalizedString(
                      //   context: context,
                      //   resString: ResString.cancel,
                      // ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      labelStyle:
                          context
                              .textStyle(palette: ColorPalette.white)
                              .xsmall
                              .semiBold,
                      color: context.applyAppColor(
                        palette: ColorPalette.primary,
                      ),
                      buttonPadding: EdgeInsets.zero,
                      label: "Logout",
                      // getLocalizedString(
                      //   context: context,
                      //   resString: ResString.logout,
                      // ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
