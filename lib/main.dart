import 'package:edusys_client/presentation/contract/contract_page_state.dart';
import 'package:edusys_client/presentation/guardian/state/guardian_page_state.dart';
import 'package:edusys_client/presentation/student/state/student_page_state.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:edusys_client/util/router.dart';
import 'package:edusys_client/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentPageState()..init()),
        ChangeNotifierProvider(create: (_) => GuardianPageState()),
        ChangeNotifierProvider(create: (_) => ContractPageState()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        title: systemName,
        theme: ThemePreferences.lightTheme,
      ),
    );
  }
}
