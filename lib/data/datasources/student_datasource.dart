import 'package:dio/dio.dart';
import 'package:edusys_client/data/datasources/base_datasource.dart';
import 'package:edusys_client/data/models/student_model.dart';

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
}
