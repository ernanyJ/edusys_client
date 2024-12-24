import 'package:edusys_client/data/models/out/student_model_out.dart';
import 'package:edusys_client/data/repositories/class_group_repository_impl.dart';
import 'package:edusys_client/data/repositories/student_repository_impl.dart';
import 'package:edusys_client/domain/entities/address_entity.dart';
import 'package:edusys_client/domain/entities/class_group_entity.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/exceptions/invalid_input.dart';
import 'package:edusys_client/util/loading_state.dart';
import 'package:flutter/material.dart';

class ClassGroupDetailsState extends ChangeNotifier {
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

  void replaceStudent(int id, StudentModelOut student) {
    var cacheStudent = StudentEntity(
      id: id,
      name: student.name,
      birthDate: DateTime.parse(student.birthDate),
      cpf: student.cpf,
      rg: student.rg,
      sex: student.sex,
      enrollment: student.enrollmentId,
      address: AddressEntity(
          id: id,
          street: student.address.street,
          city: student.address.city,
          state: student.address.state,
          zipCode: student.address.zipCode,
          country: student.address.country,
          number: student.address.number,
          complement: student.address.complement,
          neighborhood: student.address.neighborhood,
          reference: student.address.reference),
      classGroup: null,
      guardians: [],
      currentMonthPaid: null,
    );

    var currentStdIndex = students.indexWhere((element) => element.id == id);
    students[currentStdIndex] = cacheStudent;
    filteredStudents[filteredStudents.indexWhere((element) => element.id == id)] =
        cacheStudent;
    notifyListeners();
  }
}
