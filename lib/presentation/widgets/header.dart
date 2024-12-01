import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainHeader extends StatelessWidget implements PreferredSizeWidget {
  const MainHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        systemName,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: [
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
          onPressed: () => context.go('/students'),
          child: const Text(
            'Estudantes',
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
        SizedBox(width: MediaQuery.of(context).size.width * 0.55),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
