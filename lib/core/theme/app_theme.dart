import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme(bool isDark) {
    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primarySwatch: Colors.blue,
      fontFamily: 'Roboto',
    );
  }
}
