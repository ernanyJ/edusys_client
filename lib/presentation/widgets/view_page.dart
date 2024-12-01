import 'package:edusys_client/presentation/widgets/header.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: const MainHeader(),
      body: child,
    );
  }
}