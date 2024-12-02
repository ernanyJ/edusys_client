import 'package:edusys_client/data/datasources/student_datasource.dart';
import 'package:edusys_client/data/models/student_model.dart';
import 'package:edusys_client/util/loading_state.dart';
import 'package:flutter/material.dart';

class StudentPageState extends ChangeNotifier {
  LoadingState _loadingState = LoadingState.LOADING;
  LoadingState get loadingState => _loadingState;
  set loadingState(LoadingState value) {
    _loadingState = value;
    notifyListeners();
  }

  void loadStudents() async {
    StudentDatasource data = StudentDatasource();
    List<StudentModel> students = await data.getStudents();
    print(students.map((student) => student.name).toList());
  }
}
