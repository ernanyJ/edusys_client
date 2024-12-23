import 'package:dio/dio.dart';
import 'package:edusys_client/data/datasources/base_datasource.dart';
import 'package:edusys_client/data/models/in/class_group_model_in.dart';

class ClassGroupDatasource extends BaseDatasource {
  Future<List<ClassGroupModelIn>> getClassGroups() async {
    try {
      final response = await dio.get('/class-group');
      return (response.data as List)
          .map((e) => ClassGroupModelIn.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch class groups: ${e.message}');
    }
  }
}
