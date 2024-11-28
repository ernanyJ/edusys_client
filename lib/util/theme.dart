import 'package:edusys_client/util/text_theme.dart';
import 'package:flutter/material.dart';

class ThemePreferences {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Roboto',
      primaryColor: Colors.blue[700],
      primarySwatch: Colors.blue,
      textTheme: TextThemePreferences.lightTextTheme,
      scaffoldBackgroundColor: const Color.fromARGB(255, 224, 224, 224));
}
