import 'package:dio/dio.dart';
import 'package:edusys_client/data/datasources/base_datasource.dart';
import 'package:edusys_client/data/models/in/tuition_fee_model_in.dart';

class TuitionFeeDatasource extends BaseDatasource {
  Future<List<TuitionFeeModel>> getTuitionFeesFromStudent(int id) async {
    try {
      final response = await dio.get('/tuition-fee/student/$id');
      return (response.data as List)
          .map((e) => TuitionFeeModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      // Trata erros de forma específica
      throw Exception('Failed to fetch user: ${e.message}');
    }
  }
}
