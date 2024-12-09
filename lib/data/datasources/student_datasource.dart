import 'package:dio/dio.dart';
import 'package:edusys_client/data/datasources/base_datasource.dart';
import 'package:edusys_client/data/models/in/student_model_in.dart';
import 'package:edusys_client/data/models/out/student_model_out.dart';

class StudentDatasource extends BaseDatasource {
  Future<List<StudentModel>> getStudents() async {
    try {
      final response = await dio.get('/student');
      return (response.data as List)
          .map((e) => StudentModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      // Trata erros de forma específica
      throw Exception('Failed to fetch user: ${e.message}');
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

  Future<StudentModel> updateStudent(int id, StudentModelOut student) async {
    try {
      final response = await dio.put('/student/$id', data: student.toJson());
      return StudentModel.fromJson(response.data);
    } on DioException catch (e) {
      // Trata erros de forma específica
      throw Exception('Failed to update user: ${e.message}');
    }
  }
}
