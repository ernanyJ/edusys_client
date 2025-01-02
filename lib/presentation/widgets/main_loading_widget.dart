import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class MainLoadingWidget extends StatelessWidget {
  const MainLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(color: primaryColor),
      );
  }
}
