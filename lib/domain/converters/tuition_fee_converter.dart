import 'dart:convert';

import 'package:edusys_client/data/models/tuition_fee_model.dart';
import 'package:edusys_client/domain/converters/contract_converter.dart';
import 'package:edusys_client/domain/converters/guardian_converter.dart';
import 'package:edusys_client/domain/converters/student_converter.dart';
import 'package:edusys_client/domain/entities/tuition_fee_entity.dart';

class TuitionFeeConverter extends Converter<TuitionFeeModel, TuitionFeeEntity> {
  StudentConverter studentConverter = StudentConverter();
  GuardianConverter guardianConverter = GuardianConverter();
  ContractConverter contractConverter = ContractConverter();

  @override
  TuitionFeeEntity convert(TuitionFeeModel input) {
    return TuitionFeeEntity(
      id: input.id,
      dueDate: input.dueDate,
      discountPercentage: input.discountPercentage,
      baseValue: input.baseValue,
      finalValue: input.baseValue,
      paymentDate: input.paymentDate,
      paymentStatus: input.paymentStatus,
      student: studentConverter.convert(input.student),
      guardian: guardianConverter.convert(input.guardian),
      contract: contractConverter.convert(input.contract),
    );
  }
}
