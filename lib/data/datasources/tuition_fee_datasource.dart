// import 'package:edusys_client/data/datasources/base_datasource.dart';

// class TuitionFeeDatasource extends BaseDatasource {
//   Future<List<TuitionFeeModel>> getTuitionFees() async {
//     try {
//       final response = await dio.get('/tuition_fee');
//       return (response.data as List)
//           .map((e) => TuitionFeeModel.fromJson(e))
//           .toList();
//     } on DioException catch (e) {
//       // Trata erros de forma específica
//       throw Exception('Failed to fetch user: ${e.message}');
//     }
//   }
// }
