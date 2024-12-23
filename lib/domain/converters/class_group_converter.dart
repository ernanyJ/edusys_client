import 'dart:convert';

import 'package:edusys_client/data/models/in/class_group_model_in.dart';
import 'package:edusys_client/domain/entities/class_group_entity.dart';

class ClassGroupConverter extends Converter<ClassGroupModelIn, ClassGroupEntity> {
  @override
  ClassGroupEntity convert(ClassGroupModelIn input) {
    return ClassGroupEntity(
      id: input.id,
      name: input.name,
      year: input.year,
      timePeriod: input.timePeriod,
      capacity: input.capacity,
      room: input.room,
      type: input.type,
    );
  }
}
