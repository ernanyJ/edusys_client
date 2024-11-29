import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget implements PreferredSizeWidget {
  const MainHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        systemName,
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Dashboard',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Students',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Billing',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Reports',
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.6),
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
