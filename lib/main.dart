import 'package:edusys_client/presentation/contract/contract_page_state.dart';
import 'package:edusys_client/presentation/contract/widgets/student_add/create_student_dialog_state.dart';
import 'package:edusys_client/presentation/guardian/state/guardian_page_state.dart';
import 'package:edusys_client/presentation/student/state/student_page_state.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:edusys_client/util/router.dart';
import 'package:edusys_client/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
      size: Size(1366, 768),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      title: "Edusys - Gerenciamento de mensalidades");
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

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
        ChangeNotifierProvider(create: (_) => CreateStudentDialogState()),
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
