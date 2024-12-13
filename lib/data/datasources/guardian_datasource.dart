import 'package:dio/dio.dart';
import 'package:edusys_client/data/datasources/base_datasource.dart';
import 'package:edusys_client/data/models/in/guardian_model_in.dart';

class GuardianDatasource extends BaseDatasource {
  Future<List<GuardianModel>> getGuardians() async {
    try {
      final response = await dio.get('/guardian');
      return (response.data as List)
          .map((e) => GuardianModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch guardians: ${e.message}');
    }
  }
}
