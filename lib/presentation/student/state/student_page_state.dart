import 'package:edusys_client/data/repositories/student_repository_impl.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/util/loading_state.dart';
import 'package:flutter/material.dart';

class StudentPageState extends ChangeNotifier {
  LoadingState _loadingState = LoadingState.LOADING;
  LoadingState get loadingState => _loadingState;
  set loadingState(LoadingState value) {
    _loadingState = value;
    notifyListeners();
  }

  List<StudentEntity> _students = [];
  List<StudentEntity> get students => [..._students];
  set students(List<StudentEntity> value) {
    _students = value;
    notifyListeners();
  }

  void loadStudents() async {
    if (students.isNotEmpty) {
      _loadingState = LoadingState.LOADING;
      notifyListeners();
      _loadingState = LoadingState.LOADED;
      notifyListeners();
      return;
    }

    StudentRepositoryImpl repository = StudentRepositoryImpl();
    _loadingState = LoadingState.LOADING;
    notifyListeners();

    repository.getAllStudents().then((value) => students = value);
    _loadingState = LoadingState.LOADED;
    notifyListeners();
  }

  String calculateAge(DateTime birth) {
    DateTime now = DateTime.now();
    int age = now.year - birth.year;
    if (now.month < birth.month ||
        (now.month == birth.month && now.day < birth.day)) {
      age--;
    }
    return age.toString();
  }
}
