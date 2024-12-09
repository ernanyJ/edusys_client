import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class ButtonThemePreferences {
  static final lightTheme = ButtonThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: primaryColor,
        secondary: secondaryColor,
        onSecondary: secondaryColor,
        error: Colors.red,
        onError: dangerColor,
        surface: primaryColor,
        onSurface: primaryColor),
  );
}
