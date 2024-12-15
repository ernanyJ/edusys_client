import 'package:edusys_client/data/datasources/student_datasource.dart';
import 'package:edusys_client/data/models/out/student_model_out.dart';
import 'package:edusys_client/domain/converters/student_converter.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/domain/repositories/student_repository.dart';

class StudentRepositoryImpl implements StudentRepository {
  final StudentDatasource _studentDataSource = StudentDatasource();
  final StudentConverter _inConverter = StudentConverter();

  @override
  Future<List<StudentEntity>> getAllStudents() {
    return _studentDataSource
        .getStudents()
        .then((e) => e.map((e) => _inConverter.convert(e)).toList());
  }

  @override
  Future<void> deleteStudent(int id) {
    return _studentDataSource.deleteStudent(id);
  }

  @override
  Future<StudentEntity> updateStudent(int id, StudentModelOut student) {
    return _studentDataSource
        .updateStudent(id, student)
        .then((e) => _inConverter.convert(e));
  }

  @override
  Future<int> countStudents() {
    return _studentDataSource.countStudent();
  }

    @override
  Future<int> countDebts() {
    return _studentDataSource.countDebts();
  }
}
