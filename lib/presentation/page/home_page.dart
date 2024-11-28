import 'package:edusys_client/presentation/widgets/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainHeader(),
      body: SizedBox.shrink()
    );
  }
}
