import 'package:edusys_client/domain/entities/guardian_entity.dart';

abstract interface class GuardianRepository {
  Future<List<GuardianEntity>> getGuardians();
}