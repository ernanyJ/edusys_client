import 'package:edusys_client/data/repositories/guardian_repository_impl.dart';
import 'package:edusys_client/domain/entities/guardian_entity.dart';
import 'package:flutter/material.dart';

class GuardianPageState extends ChangeNotifier {
  List<GuardianEntity> guardians = [];

  Future<void> loadGuardians(BuildContext context) async {
    try {
      guardians = await GuardianRepositoryImpl().getGuardians();
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
