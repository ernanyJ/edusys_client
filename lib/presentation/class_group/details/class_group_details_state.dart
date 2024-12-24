import 'package:edusys_client/data/repositories/class_group_repository_impl.dart';
import 'package:edusys_client/data/repositories/student_repository_impl.dart';
import 'package:edusys_client/domain/entities/class_group_entity.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/exceptions/invalid_input.dart';
import 'package:edusys_client/util/loading_state.dart';
import 'package:flutter/material.dart';

class   ClassGroupDetailsState extends ChangeNotifier {
  void init(int id) {
    getStudentsByClassGroup(id);
  }

  List<StudentEntity> students = [];
  List<StudentEntity> filteredStudents = [];

  LoadingState _loadingState = LoadingState.LOADING;
  LoadingState get loadingState => _loadingState;

  void getStudentsByClassGroup(int id) {
    _loadingState = LoadingState.LOADING;
    notifyListeners();

    StudentRepositoryImpl().getStudentsByClassGroup(id).then((value) {
      students = value;
      filteredStudents = value;

      _loadingState = LoadingState.LOADED;
      notifyListeners();
    });
  }

  void searchStudentsByName(String name) {
    if (name.isEmpty) {
      filteredStudents = List.from(students);
    } else {
      filteredStudents = students
          .where((element) =>
              element.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
    }

    notifyListeners();
  }

  List<ClassGroupEntity> classes = [];

  String? selectedClass;

  var moveStudentClassGroupKey = GlobalKey<FormState>();

  TextEditingController askPasswordController = TextEditingController();

  TextEditingController justifyController = TextEditingController();

  void getClassGroups() {
    ClassGroupRepositoryImpl().getClassGroups().then((value) {
      classes = value;
      notifyListeners();
    });
  }

  void setSelectedClass(String? value) {
    selectedClass = value;
    notifyListeners();
  }

  void moveStudentClassGroup(int studentId) {
    if (moveStudentClassGroupKey.currentState!.validate() &&
        selectedClass != null) {
      try {
        StudentRepositoryImpl().updateStudentClass(
          studentId,
          int.parse(selectedClass!),
        );

        removeStudent(studentId);
      } catch (e) {
        throw InvalidInput('Erro ao mover aluno de turma.');
      }
    }
  }

  void removeStudent(int id) {
    filteredStudents.removeWhere((element) => element.id == id);
    notifyListeners();
  }

   void clearMoveStudentDialogData() {
    askPasswordController.clear();
    justifyController.clear();
    selectedClass = null;
    notifyListeners();
  }
}
