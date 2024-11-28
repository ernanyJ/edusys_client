import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

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
          onPressed: () {},
          child: const Text(
            'Dashboard',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Students',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Billing',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Reports',
            style: TextStyle(color: Colors.black),
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
