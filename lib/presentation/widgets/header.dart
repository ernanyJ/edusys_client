import 'package:edusys_client/presentation/guardian/state/guardian_page_state.dart';
import 'package:edusys_client/presentation/student/state/student_page_state.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainHeader extends StatelessWidget implements PreferredSizeWidget {
  const MainHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<StudentPageState>(context);
    final guardianState = Provider.of<GuardianPageState>(context);
    return AppBar(
      actions: [
        const SizedBox(width: 20),
        Text(
          systemName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(width: 20),
        TextButton(
          onPressed: () => {
            context.go('/'),
          },
          style: Theme.of(context).textButtonTheme.style,
          child: const Text(
            'Dashboard',
          ),
        ),
        TextButton(
          onPressed: () {
            state.students.isEmpty ? state.loadStudents(context) : null;
            context.go('/students');
          },
          child: const Text(
            'Estudantes',
          ),
        ),
        TextButton(
          onPressed: () {
            guardianState.guardians.isEmpty
                ? guardianState.loadGuardians(context)
                : null;
            context.go('/guardian');
          },
          child: const Text(
            'Responsáveis',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Mensalidades',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Relatórios',
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => context.go('/configurations'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
