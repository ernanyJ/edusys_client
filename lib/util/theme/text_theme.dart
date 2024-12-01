import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class TextThemePreferences {
  
    static TextTheme lightTextTheme = TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: primaryColor,  
        fontFamily: 'Roboto'
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primaryColor,  
        fontFamily: 'Roboto'
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: primaryColor,  
        fontFamily: 'Roboto'
      ),
      bodyLarge: const TextStyle(
        fontSize: 18,
        color: Colors.black,  
        fontFamily: 'Roboto'
      ),
      bodyMedium: const TextStyle(
        fontSize: 16,
        color: Colors.black,  
        fontFamily: 'Roboto'
      ),
      bodySmall: const TextStyle(
        fontSize: 14,
        color: Colors.black,  
        fontFamily: 'Roboto'
      ),
    );
    
}