import 'package:edusys_client/data/datasources/class_group_datasource.dart';
import 'package:edusys_client/domain/converters/class_group_converter.dart';
import 'package:edusys_client/domain/entities/class_group_entity.dart';
import 'package:edusys_client/domain/repositories/class_group_repository.dart';

class ClassGroupRepositoryImpl implements ClassGroupRepository {
  ClassGroupDatasource dataSource = ClassGroupDatasource();
  ClassGroupConverter converter = ClassGroupConverter();

  @override
  Future<List<ClassGroupEntity>> getClassGroups() {
    return dataSource
        .getClassGroups()
        .then((value) => value.map((e) => converter.convert(e)).toList());
  }

}
