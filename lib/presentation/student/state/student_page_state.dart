import 'package:edusys_client/data/models/out/student_model_out.dart';
import 'package:edusys_client/data/repositories/student_repository_impl.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/util/loading_state.dart';
import 'package:flutter/material.dart';

class StudentPageState extends ChangeNotifier {
  StudentRepositoryImpl repository = StudentRepositoryImpl();

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

  void reloadStudents(BuildContext context) {
    _loadingState = LoadingState.LOADING;
    notifyListeners();
    _students = [];

    loadStudents(context);
    _loadingState = LoadingState.LOADED;
    notifyListeners();
  }

  void loadStudents(BuildContext context) async {
    if (students.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lista de estudantes já carregada!'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

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

  orderBy(bool ascending, int columnIndex) {
    switch (columnIndex) {
      case 1:
        _students.sort((a, b) =>
            ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
        notifyListeners();
        break;
      case 2:
        _students.sort((a, b) => ascending
            ? a.classGroup.room.compareTo(b.classGroup.room)
            : b.classGroup.room.compareTo(a.classGroup.room));
        notifyListeners();
        break;
      case 3:
        _students.sort((a, b) => ascending
            ? a.currentMonthPaid!.value.compareTo(b.currentMonthPaid!.value)
            : b.currentMonthPaid!.value.compareTo(a.currentMonthPaid!.value));
        notifyListeners();
        break;
      case 4:
        _students.sort((a, b) =>
            ascending ? a.cpf.compareTo(b.cpf) : b.cpf.compareTo(a.cpf));
        notifyListeners();
        break;
      case 5:
        _students.sort((a, b) => ascending
            ? a.guardians.first.name.compareTo(b.guardians.first.name)
            : b.guardians.first.name.compareTo(a.guardians.first.name));
        notifyListeners();
        break;
      case 6:
        _students.sort((a, b) => ascending
            ? a.enrollment.compareTo(b.enrollment)
            : b.enrollment.compareTo(a.enrollment));
        notifyListeners();
        break;
      default:
        break;
    }
  }

  void deleteStudent(int id, BuildContext context) {
    repository.deleteStudent(id);
    _students.removeWhere((element) => element.id == id);
    Navigator.of(context).pop();
    notifyListeners();
  }

  updateStudent(StudentEntity student) {
    repository.updateStudent(student.id, StudentModelOut.fromEntity(student));
    notifyListeners();
  }
}
