import 'package:dio/dio.dart';
import 'package:edusys_client/data/datasources/base_datasource.dart';
import 'package:edusys_client/data/models/in/contract_model_in.dart';

class ContractDatasource extends BaseDatasource {
  Future<List<ContractModel>> getContracts() async {
    try {
      final response = await dio.get('/contract');
      return (response.data as List)
          .map((e) => ContractModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch user: ${e.message}');
    }
  }
}
