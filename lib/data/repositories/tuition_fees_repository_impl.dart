import 'package:edusys_client/data/datasources/tuition_fee_datasource.dart';
import 'package:edusys_client/domain/converters/tuition_fee_converter.dart';
import 'package:edusys_client/domain/entities/tuition_fee_entity.dart';
import 'package:edusys_client/domain/repositories/tuition_fee_repository.dart';

class TuitionFeesRepositoryImpl implements TuitionFeeRepository {
  TuitionFeeDatasource datasource = TuitionFeeDatasource();
  TuitionFeeConverter inConverter = TuitionFeeConverter();

  @override
  Future<List<TuitionFeeEntity>> getTuitionFeesFromStudent(int id) async {
    return await datasource
        .getTuitionFeesFromStudent(id)
        .then((e) => e.map((e) => inConverter.convert(e)).toList());
    
  }
}
