import 'package:edusys_client/core/page_model.dart';
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

  @override
  Future<List<StudentEntity>> getStudentsByClassGroup(int id) {
    return _studentDataSource
        .getStudentsByClassGroup(id)
        .then((e) => e.map((e) => _inConverter.convert(e)).toList());
  }

  @override
  Future<void> updateStudentClass(int id, int classId) {
    return _studentDataSource.updateStudentClass(id, classId);
  }

  @override
  Future<PageModel<StudentEntity>> searchStudentsByQuery(
      String query, int page, int size) {
    return _studentDataSource
        .searchStudentsByQuery(query, page, size)
        .then((e) => PageModel(
              content: e.content.map((e) => _inConverter.convert(e)).toList(),
              totalPages: e.totalPages,
              totalElements: e.totalElements,
              currentPage: e.currentPage,
            ));
  }

  @override
  Future<PageModel<StudentEntity>> getStudentsPaginated(int page, int size) {
    return _studentDataSource
        .getStudentsPaginated(page, size)
        .then((e) => PageModel(
              content: e.content.map((e) => _inConverter.convert(e)).toList(),
              totalPages: e.totalPages,
              totalElements: e.totalElements,
              currentPage: e.currentPage,
            ));
  }
}
