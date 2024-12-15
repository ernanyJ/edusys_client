import 'dart:convert';

import 'package:edusys_client/data/models/in/tuition_fee_model_in.dart';
import 'package:edusys_client/domain/converters/contract_converter.dart';
import 'package:edusys_client/domain/converters/guardian_converter.dart';
import 'package:edusys_client/domain/converters/student_converter.dart';
import 'package:edusys_client/domain/entities/tuition_fee_entity.dart';

class TuitionFeeConverter extends Converter<TuitionFeeModel, TuitionFeeEntity> {
  StudentConverter studentConverter = StudentConverter();
  GuardianConverter guardianConverter = GuardianConverter();
  ContractInConverter contractConverter = ContractInConverter();

  @override
  TuitionFeeEntity convert(TuitionFeeModel input) {
    return TuitionFeeEntity(
      id: input.id,
      dueDate: input.dueDate,
      discountPercentage: input.discountPercentage,
      baseValue: input.baseValue,
      finalValue: input.baseValue,
      paymentDate: input.paymentDate,
      status: input.status,
    );
  }
}
