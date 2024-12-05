import 'dart:convert';

import 'package:edusys_client/data/models/contract_model.dart';
import 'package:edusys_client/domain/converters/guardian_converter.dart';
import 'package:edusys_client/domain/converters/student_converter.dart';
import 'package:edusys_client/domain/entities/contract_entity.dart';

class ContractConverter extends Converter<ContractModel, ContractEntity> {
  StudentConverter studentConverter = StudentConverter();
  GuardianConverter guardianConverter = GuardianConverter();

  @override
  ContractEntity convert(ContractModel input) {
    return ContractEntity(
      id: input.id,
      startDate: input.startDate,
      endDate: input.endDate,
      status: input.status,
      student: studentConverter.convert(input.student),
      guardian: guardianConverter.convert(input.guardian),
    );
  }
}
