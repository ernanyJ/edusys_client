import 'dart:convert';

import 'package:edusys_client/data/models/in/student_model_in.dart';
import 'package:edusys_client/domain/converters/address_converter.dart';
import 'package:edusys_client/domain/converters/class_group_converter.dart';
import 'package:edusys_client/domain/converters/guardian_converter.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';

class StudentConverter extends Converter<StudentModel, StudentEntity> {
  final AddressConverter addressConverter = AddressConverter();
  final ClassGroupConverter classGroupConverter = ClassGroupConverter();
  final GuardianConverter guardianConverter = GuardianConverter();

  @override
  StudentEntity convert(StudentModel input) {
    return StudentEntity(
      id: input.id,
      name: input.name,
      address: addressConverter.convert(input.address),
      cpf: input.cpf,
      birthDate: input.birthDate,
      rg: input.rg,
      sex: input.sex,
      enrollment: input.enrollment,
      classGroup: input.classGroup != null ? classGroupConverter.convert(input.classGroup!) : null,
      guardians:
          input.guardians.map((e) => guardianConverter.convert(e)).toList(),
      currentMonthPaid: input.currentMonthPaid,
    );
  }
}
