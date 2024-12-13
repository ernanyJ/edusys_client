import 'package:edusys_client/data/datasources/guardian_datasource.dart';
import 'package:edusys_client/domain/converters/guardian_converter.dart';
import 'package:edusys_client/domain/entities/guardian_entity.dart';
import 'package:edusys_client/domain/repositories/guardian_repository.dart';

class GuardianRepositoryImpl implements GuardianRepository {
  GuardianDatasource dataSource = GuardianDatasource();
  GuardianConverter inConverter = GuardianConverter();

  @override
  Future<List<GuardianEntity>> getGuardians() {
    return dataSource
        .getGuardians()
        .then((e) => e.map((e) => inConverter.convert(e)).toList());
  }
}
