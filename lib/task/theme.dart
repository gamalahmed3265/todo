import 'package:flutter/material.dart';

enum ThemeType { light, dark }

extension ThemeExt on ThemeType {
  String get theme {
    switch (this) {
      case ThemeType.light:
        return "light";
      case ThemeType.dark:
        return "dark";
    }
  }
}

class ColorManager {
  static const Color blueclr = Color(0xFF4e5ae8);
  static const Color yallowClr = Color(0xFFFFB746);
  static const Color pinkClr = Color(0xFFff4667);
  static const Color darkGreyClr = Color(0xFF121212);
  static const Color darkHeaderClr = Color(0xFF424242);
}

class ThemeManager {
  static ThemeData lightTheme = ThemeData(
      primaryColor: ColorManager.blueclr, brightness: Brightness.light);
  static ThemeData darkTheme = ThemeData(
      primaryColor: ColorManager.blueclr, brightness: Brightness.dark);
}
