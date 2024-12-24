import 'package:edusys_client/domain/entities/class_group_entity.dart';
import 'package:edusys_client/presentation/class_group/class_group_page.dart';
import 'package:edusys_client/presentation/class_group/class_group_page_state.dart';
import 'package:edusys_client/presentation/class_group/details/class_group_details_page.dart';
import 'package:edusys_client/presentation/class_group/details/class_group_details_state.dart';
import 'package:edusys_client/presentation/configuration/configuration_page.dart';
import 'package:edusys_client/presentation/contract/contract_page.dart';
import 'package:edusys_client/presentation/contract/pages/add_contract/add_contract_page.dart';
import 'package:edusys_client/presentation/contract/pages/add_contract/add_contract_page_state.dart';
import 'package:edusys_client/presentation/guardian/guardian_page.dart';
import 'package:edusys_client/presentation/home_page.dart';
import 'package:edusys_client/presentation/student/add_%20student/add_student_page.dart';
import 'package:edusys_client/presentation/student/students_page.dart';
import 'package:edusys_client/presentation/widgets/view_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/students', // TODO: mudar depois de implementar homepage
  routes: [
    ShellRoute(
      builder: (context, state, child) => ViewPage(
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/students',
          routes: [
            GoRoute(
              path: 'add',
              builder: (context, state) => const AddStudentPage(),
            ),
          ],
          builder: (context, state) => const StudentsPage(),
        ),
        GoRoute(
            path: '/contract',
            builder: (context, state) => const ContractPage(),
            routes: [
              GoRoute(
                  path: 'add',
                  builder: (context, state) => ChangeNotifierProvider(
                      create: (context) => AddContractPageState(),
                      child: const ContractAddPage()))
            ]),
        GoRoute(
          path: '/guardian',
          builder: (context, state) => const GuardianPage(),
        ),
        GoRoute(
          path: '/class-group',
          builder: (context, state) => ChangeNotifierProvider(
              create: (context) => ClassGroupPageState(),
              child: const ClassGroupPage()),
          routes: [
            GoRoute(
              path: 'details/:id',
              builder: (context, state) => ClassGroupDetailsPage(state.extra as ClassGroupEntity),
            )
          ],
        ),
        GoRoute(
            path: '/configurations',
            builder: (context, state) => const ConfigurationPage())
      ],
    )
  ],
);
