import 'package:edusys_client/presentation/page/home_page.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:edusys_client/util/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: systemName,
      theme: ThemePreferences.lightTheme,
      home: const HomePage(),
    );
  }
}
