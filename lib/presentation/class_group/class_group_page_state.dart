import 'package:edusys_client/data/repositories/class_group_repository_impl.dart';
import 'package:edusys_client/domain/entities/class_group_entity.dart';
import 'package:edusys_client/enums/class_group_type.dart';
import 'package:edusys_client/util/loading_state.dart';
import 'package:flutter/material.dart';

class ClassGroupPageState extends ChangeNotifier {
  List<ClassGroupEntity> classGroups = [];
  List<ClassGroupEntity> viewClassGroups = [];

  LoadingState _loadingState = LoadingState.LOADING;
  LoadingState get loadingState => _loadingState;


  void getClassGroups() {
    _loadingState = LoadingState.LOADING;
    notifyListeners();
    ClassGroupRepositoryImpl().getClassGroups().then((value) {
      classGroups = value;
      viewClassGroups = value;
      _loadingState = LoadingState.LOADED;
      notifyListeners();
    });
  }

  void filterClassGroups(String? value) {
    if (value == 'ALL') {
      viewClassGroups = classGroups;
      notifyListeners();
      return;
    }

    if (value == 'ELEMENTARY') {
      viewClassGroups = classGroups
          .where((element) => element.type == ClassGroupType.ELEMENTARY)
          .toList();
      notifyListeners();
    }

    if (value == 'CRECHE') {
      viewClassGroups = classGroups
          .where((element) => element.type == ClassGroupType.CRECHE)
          .toList();
      notifyListeners();
    }
  }
}
