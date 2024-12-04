import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class TextThemePreferences {
  
    static TextTheme lightTextTheme = TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: primaryColor,  
        fontFamily: 'Inter'
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primaryColor,  
        fontFamily: 'Inter'
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: primaryColor,  
        fontFamily: 'Inter'
      ),
      bodyLarge: const TextStyle(
        fontSize: 18,
        color: Colors.black,  
        fontFamily: 'Inter'
      ),
      bodyMedium: const TextStyle(
        fontSize: 16,
        color: Colors.black,  
        fontFamily: 'Inter'
      ),
      bodySmall: const TextStyle(
        fontSize: 14,
        color: Colors.black,  
        fontFamily: 'Inter'
      ),
      displaySmall:  const TextStyle(
        fontSize: 30,
        color: Colors.black,  
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter'
      ),
       labelSmall:  const TextStyle(
        fontSize: 15,
        color: Colors.white,  
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter'
      ),
    );
    
}