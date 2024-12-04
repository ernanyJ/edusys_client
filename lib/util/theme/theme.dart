import 'package:edusys_client/util/theme/button_theme.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:edusys_client/util/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ThemePreferences {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Roboto',
      primaryColor: Colors.blue[700],
      primarySwatch: Colors.blue,
      textTheme: TextThemePreferences.lightTextTheme,
      buttonTheme: ButtonThemePreferences.lightTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          textStyle: WidgetStateProperty.all<TextStyle>(
            const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Roboto'
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
    ///      backgroundColor: WidgetStateProperty.all<Color>(Colors.grey[200]!),
          foregroundColor: WidgetStateProperty.all<Color>(primaryColor),
          textStyle: WidgetStateProperty.all<TextStyle>(
            const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Roboto'
            ),
          ),  
        ),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 224, 224, 224));
}
