import 'package:edusys_client/data/models/out/student_model_out.dart';
import 'package:edusys_client/data/repositories/student_repository_impl.dart';
import 'package:edusys_client/domain/entities/address_entity.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/exceptions/cpf_exception.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:edusys_client/util/loading_state.dart';
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

  LoadingState _loadingState = LoadingState.LOADING;
  LoadingState get loadingState => _loadingState;
  set loadingState(LoadingState value) {
    _loadingState = value;
    notifyListeners();
  }

  Future<void> countStudents() async {
    _studentCount = await repository.countStudents();
    _studentDebtCount = await repository.countDebts();
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

    countStudents();

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
      case 0:
        _students.sort(
            (a, b) => ascending ? a.id.compareTo(b.id) : b.id.compareTo(a.id));
        notifyListeners();
        break;
      case 1:
        _students.sort((a, b) =>
            ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
        notifyListeners();
        break;
      case 2:
        _students.sort((a, b) => ascending
            ? (a.classGroup?.room ?? '').compareTo(b.classGroup?.room ?? '')
            : (b.classGroup?.room ?? '').compareTo(a.classGroup?.room ?? ''));
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
            ? (a.enrollment as int? ?? 0).compareTo(b.enrollment as int? ?? 0)
            : (b.enrollment as int? ?? 0).compareTo(a.enrollment as int? ?? 0));
        notifyListeners();
        break;
      default:
        break;
    }
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
      _students.remove(_students.firstWhere((element) => element.id == id));
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
    var currentClass =
        _students.firstWhere((element) => element.id == id).classGroup;
    var currentGuardians =
        _students.firstWhere((element) => element.id == id).guardians;
    var currentMonthPaid =
        _students.firstWhere((element) => element.id == id).currentMonthPaid;

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
        classGroup: currentClass,
        guardians: currentGuardians,
        currentMonthPaid: currentMonthPaid);

    _students.remove(_students.firstWhere((element) => element.id == id));
    _students.add(cacheStudent);
    _students.sort((a, b) => a.id.compareTo(b.id));
    notifyListeners();
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
}
