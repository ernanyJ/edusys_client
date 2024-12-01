import 'package:edusys_client/presentation/home_page.dart';
import 'package:edusys_client/presentation/student/students_page.dart';
import 'package:edusys_client/presentation/widgets/view_page.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/students', // TODO: mudar depois de implementar homepage
  routes: [
    ShellRoute(
      builder: (context, state, child) => ViewPage(child: child,),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/students',
          builder: (context, state) => const StudentsPage(),
        ),
      ],
    )
  ],
);
