import 'package:edusys_client/data/repositories/guardian_repository_impl.dart';
import 'package:edusys_client/domain/entities/guardian_entity.dart';
import 'package:edusys_client/util/loading_state.dart';
import 'package:flutter/material.dart';

class GuardianPageState extends ChangeNotifier {
  List<GuardianEntity> guardians = [];

  LoadingState _loadingState = LoadingState.LOADING;
  LoadingState get loadingState => _loadingState;

  Future<void> loadGuardians(BuildContext context) async {
    guardians = [];
    notifyListeners();

    try {
      _loadingState = LoadingState.LOADING;
      notifyListeners();
      guardians = await GuardianRepositoryImpl().getGuardians();
      _loadingState = LoadingState.LOADED;
      notifyListeners();
    } catch (e) {
      _loadingState = LoadingState.ERROR;
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
