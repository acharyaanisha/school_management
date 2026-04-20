// class AppColor {
//   static const primaryColor = 0xFF1E88E5;
//   static const secondaryColor = 0xFF42A5F5;
// }

// class ColorPalette {
//   static const primary = 0xFF1E88E5;
//   static const secondary = 0xFF42A5F5;
// }

import 'package:flutter/material.dart';

class ColorPalette {
  static MaterialColor error = MaterialColorPalette.error;
  static MaterialColor warning = MaterialColorPalette.warning;
  static MaterialColor success = MaterialColorPalette.success;
  static MaterialColor white = MaterialColorPalette.white;
  static MaterialColor black = MaterialColorPalette.black;
  static MaterialColor primary = MaterialColorPalette.primary;
  static MaterialColor secondary = MaterialColorPalette.secondary;
  static MaterialColor detail = MaterialColorPalette.detail;
}

class AppColor {
  // static const Color primaryColor = Color(0xFF2C6EFD);
  // static const Color primaryColor = Color(0xFF5C6F2B);
  static const Color primaryColor = Color(0xFF219189);

  static const Color successColor = Color(0xFF00C247);
  static const Color errorColor = Color(0xFFFF3333);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color pageBodyColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color spalshScreenBGColor = Color(0xFF98B9FE);
  static const Color greyColor = Color(0xFFBDBDBD);
}

class MaterialColorPalette {
  static MaterialColor white = const MaterialColor(0xFFFFFFFF, <int, Color>{
    500: Color(0xFFFFFFFF),
  });
  static MaterialColor black = const MaterialColor(0xFF000000, <int, Color>{
    500: Color(0xFF000000),
  });

  static MaterialColor error = const MaterialColor(0xFFFF3333, <int, Color>{
    50: Color(0xFFFFFAF9),
    100: Color(0xFFFECACA),
    200: Color(0xFFFCA5A5),
    300: Color(0xFFF87171),
    400: Color(0xFFEF4444),
    500: Color(0xFFFF3333),
    600: Color(0xFFB91C1C),
    700: Color(0xFF991B1B),
    800: Color(0xFF7F1D1D),
    900: Color(0xFF4C0D0D),
    950: Color(0xFF330808),
  });

  static MaterialColor warning = const MaterialColor(0xFFFFE16A, <int, Color>{
    50: Color(0xFFFEF3C7),
    100: Color(0xFFFDE68A),
    200: Color(0xFFFCD34D),
    300: Color(0xFFFBBF24),
    400: Color(0xFFF59E0B),
    500: Color(0xFFFFE16A),
    600: Color(0xFFFFBF00),
    700: Color(0xFF92400E),
    800: Color(0xFF78350F),
    900: Color(0xFF451A03),
    950: Color(0xFF2E1101),
  });

  static MaterialColor success = const MaterialColor(0xFF00C247, <int, Color>{
    50: Color(0xFFD1FAE5),
    100: Color(0xFFA7F3D0),
    200: Color(0xFF6EE7B7),
    300: Color(0xFF34D399),
    400: Color(0xFF10B981),
    500: Color(0xFF00C247),
    600: Color(0xFF047857),
    700: Color(0xFF065F46),
    800: Color(0xFF064E3B),
    900: Color(0xFF022C22),
    950: Color(0xFF011711),
  });

  static MaterialColor primary = const MaterialColor(0xFF2C6EFD, <int, Color>{
    50: Color(0xFFF0F8FC),
    // 100: Color(0xFFEAF0FF),
    100: Color(0xFFEAFAF9),

    200: Color(0xFFABC5FF),
    300: Color(0xFF6B9AFF),
    400: Color(0xFF2C6EFD),
    // 500: Color(0xFF2C6EFD),
    500: Color(0xFF219189),

    600: Color(0xFF0C42B9),
    700: Color(0xFF002880),
    800: Color(0xFF00184d),
    900: Color(0xFF002575),
  });

  static MaterialColor secondary = const MaterialColor(0xFF42D3A9, <int, Color>{
    100: Color(0xFFEFFFFA),
    200: Color(0xFFBFFFEC),
    300: Color(0xFF42D3A9),
    400: Color(0xFF2BAA85),
    500: Color(0xFF42D3A9),
    600: Color(0xFF198163),
    700: Color(0xFF0C5942),
    800: Color(0xFF0C5942),
    900: Color(0xFF0C5942),
  });

  static MaterialColor detail = const MaterialColor(0xFF827D7D, <int, Color>{
    50: Color(0xFFffffff),
    100: Color(0xFFfafafa),
    200: Color(0xFFf5f5f5),
    300: Color(0xFFf0f0f0),
    400: Color(0xFFdedede),
    500: Color(0xFF827D7D),
    600: Color(0xFF979797),
    700: Color(0xFF818181),
    800: Color(0xFF606060),
    900: Color(0xFF3c3c3c),
  });
}
