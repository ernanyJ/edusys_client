import 'package:dio/dio.dart';
import 'package:edusys_client/core/page_model.dart';
import 'package:edusys_client/data/datasources/base_datasource.dart';
import 'package:edusys_client/data/models/in/student_model_in.dart';
import 'package:edusys_client/data/models/out/student_model_out.dart';
import 'package:edusys_client/exceptions/cpf_exception.dart';

class StudentDatasource extends BaseDatasource {
  Future<List<StudentModelIn>> getStudents() async {
    try {
      final response = await dio.get('/student');
      return (response.data as List)
          .map((e) => StudentModelIn.fromJson(e))
          .toList();
    } on DioException catch (e) {
      // Trata erros de forma específica
      throw Exception('Failed to fetch user: ${e.message}');
    }
  }

  Future<PageModel<StudentModelIn>> searchStudentsByQuery(
      String query, int page, int size) async {
    try {
      final response = await dio.get('/student/search',
          queryParameters: {'query': query, 'page': page, 'size': size});
      return PageModel.fromJson(
          response.data, (e) => StudentModelIn.fromJson(e));
    } on DioException catch (e) {
      // Trata erros de forma específica
      throw Exception('Failed to search students: ${e.message}');
    }
  }

  Future<void> deleteStudent(int id) async {
    try {
      await dio.delete('/student/$id');
    } on DioException catch (e) {
      // Trata erros de forma específica
      throw Exception('Failed to delete user: ${e.message}');
    }
  }

  Future<StudentModelIn> updateStudent(int id, StudentModelOut student) async {
    try {
      final response = await dio.put('/student/$id', data: student.toJson());
      return StudentModelIn.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response.toString().contains('CPF')) {
        throw CpfException('CPF Inválido.');
      }
      throw Exception('Failed to update user: ${e.response}');
    }
  }

  Future<PageModel<StudentModelIn>> getStudentsPaginated(
      int page, int size) async {
    try {
      final response = await dio
          .get('/student/page', queryParameters: {'page': page, 'size': size});
      return PageModel.fromJson(
          response.data, (e) => StudentModelIn.fromJson(e));
    } on DioException catch (e) {
      // Trata erros de forma específica
      throw Exception('Failed to fetch user: ${e.message}');
    }
  }

  Future<int> countStudent() {
    return dio.get('/student/count').then((e) => e.data);
  }

  Future<int> countDebts() {
    return dio.get('/student/with-debts').then((e) => e.data);
  }

  Future<List<StudentModelIn>> getStudentsByClassGroup(int classGroupId) {
    return dio.get('/student/class-group/$classGroupId').then((e) =>
        (e.data as List).map((e) => StudentModelIn.fromJson(e)).toList());
  }

  Future<void> updateStudentClass(int id, int classId) {
    var response = dio.patch('/student/$id/class-group/$classId').then((e) => {
          if (e.statusCode != 200)
            throw Exception('Failed to update student class group')
        });

    return response;
  }
}
