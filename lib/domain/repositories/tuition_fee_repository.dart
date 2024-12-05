import 'package:edusys_client/domain/entities/tuition_fee_entity.dart';

abstract interface class TuitionFeeRepository {
  
  Future<List<TuitionFeeEntity>> getTuitionFeesFromStudent(int id);
}