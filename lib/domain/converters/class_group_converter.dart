import 'dart:convert';

import 'package:edusys_client/data/models/class_group_model.dart';
import 'package:edusys_client/domain/entities/class_group_entity.dart';

class ClassGroupConverter extends Converter<ClassGroupModel, ClassGroupEntity> {
  @override
  ClassGroupEntity convert(ClassGroupModel input) {
    return ClassGroupEntity(
        id: input.id,
        name: input.name,
        year: input.year,
        timePeriod: input.timePeriod,
        capacity: input.capacity,
        room: input.room);
  }
}
