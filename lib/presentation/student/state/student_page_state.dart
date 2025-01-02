import 'dart:async';

import 'package:data_table_2/data_table_2.dart';
import 'package:edusys_client/core/page_model.dart';
import 'package:edusys_client/data/models/out/student_model_out.dart';
import 'package:edusys_client/data/repositories/student_repository_impl.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/exceptions/cpf_exception.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class StudentPageState extends ChangeNotifier {
  StudentRepositoryImpl repository = StudentRepositoryImpl();

  init() async {
    await countStudents();
  }

  int _studentCount = 0;
  int _studentDebtCount = 0;

  int get studentDebtCount => _studentDebtCount;
  int get studentCount => _studentCount;

  //LoadingState _loadingState = LoadingState.LOADING;
  // LoadingState get loadingState => _loadingState;
  // set loadingState(LoadingState value) {
  //   _loadingState = value;
  //   notifyListeners();
  // }

  Future<void> countStudents() async {
    _studentCount = await repository.countStudents();
    _studentDebtCount = await repository.countDebts();
    notifyListeners();
  }

  void reloadStudents() {
    // _loadingState = LoadingState.LOADING;
    notifyListeners();

    countStudents();

    // loadStudents();
    // _loadingState = LoadingState.LOADED;
    notifyListeners();
  }

  // void loadStudents() async {
  //   if (students.isNotEmpty) {
  //     return;
  //   }

  //   // _loadingState = LoadingState.LOADING;
  //   notifyListeners();

  //   repository.getAllStudents().then((value) => students = value);
  //   // _loadingState = LoadingState.LOADED;
  //   notifyListeners();
  // }

  Future<PageModel<StudentEntity>> loadPaginatedStudents(
      {required int page, required int size}) async {
    var result = await repository.getStudentsPaginated(page, size);
    return result;
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

  Future<void> deleteStudent(int id, BuildContext context) async {
    try {
      await repository.deleteStudent(id);
      notifyListeners();
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: successColor,
            content: const Text('Estudante deletado com sucesso!'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
      // _students.remove(_students.firstWhere((element) => element.id == id));
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: dangerColor,
            content: Text('Erro ao deletar estudante: $e'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  updateStudent(int id, StudentModelOut student, BuildContext context) async {
    // var currentClass =
    //     _students.firstWhere((element) => element.id == id).classGroup;
    // var currentGuardians =
    //     _students.firstWhere((element) => element.id == id).guardians;
    // var currentMonthPaid =
    //     _students.firstWhere((element) => element.id == id).currentMonthPaid;

    // var cacheStudent = StudentEntity(
    //     id: id,
    //     name: student.name,
    //     birthDate: DateTime.parse(student.birthDate),
    //     cpf: student.cpf,
    //     rg: student.rg,
    //     sex: student.sex,
    //     enrollment: student.enrollmentId,
    //     address: AddressEntity(
    //         id: id,
    //         street: student.address.street,
    //         city: student.address.city,
    //         state: student.address.state,
    //         zipCode: student.address.zipCode,
    //         country: student.address.country,
    //         number: student.address.number,
    //         complement: student.address.complement,
    //         neighborhood: student.address.neighborhood,
    //         reference: student.address.reference),
    //     classGroup: currentClass,
    //     guardians: currentGuardians,
    //     currentMonthPaid: currentMonthPaid);

    // // _students.remove(_students.firstWhere((element) => element.id == id));
    // // _students.add(cacheStudent);
    // // _students.sort((a, b) => a.id.compareTo(b.id));
    // notifyListeners();
    try {
      await repository.updateStudent(id, student);
    } on CpfException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: dangerColor,
            content: Text('Erro ao atualizar estudante: ${e.message}'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: dangerColor,
            content: Text('Erro ao atualizar estudante: $e'),
            duration: const Duration(seconds: 2),
          ),
        );
      }

      rethrow;
    }
    notifyListeners();
  }

  PaginatorController paginatorController = PaginatorController();

  String query = '';

  Future<PageModel<StudentEntity>> searchStudentsByQuery(
      String query, int page, int size) async {
    return await repository.searchStudentsByQuery(query, page, size);
  }
}
