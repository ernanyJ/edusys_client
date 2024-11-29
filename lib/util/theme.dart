import 'package:edusys_client/util/consts.dart';
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
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: primaryColor,
            onPrimary: primaryColor,
            secondary: secondaryColor,
            onSecondary: secondaryColor,
            error: Colors.red,
            onError: errorColor,
            surface: primaryColor,
            onSurface: primaryColor),
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 224, 224, 224));

  static ThemeData appTheme = ThemeData(
    primaryColor: const Color(
        0xFF1E88E5), // Azul semelhante ao destaque do botão "Add New Student"
    scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Cor de fundo suave
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E88E5), // Azul similar ao destaque
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ), // Títulos
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.black54, // Texto descritivo
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ), // Texto dos botões
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF1E88E5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey; // Cor para o botão desabilitado
            }
            return Color(0xFF1E88E5); // Azul para estados normais
          },
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Bordas arredondadas
          ),
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.blue.withOpacity(0.1); // Cor ao pressionar
            }
            return Colors.transparent;
          },
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.grey.shade200,
      selectedColor: Colors.green.shade100,
      secondarySelectedColor: Colors.red.shade100,
      labelStyle: const TextStyle(
        color: Colors.black87,
      ),
      secondaryLabelStyle: const TextStyle(
        color: Colors.black87,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    dividerColor: Colors.grey.shade300,
  );
}
