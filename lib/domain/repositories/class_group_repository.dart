import 'package:edusys_client/domain/entities/class_group_entity.dart';

abstract interface class ClassGroupRepository {
  Future<List<ClassGroupEntity>> getClassGroups();
}
