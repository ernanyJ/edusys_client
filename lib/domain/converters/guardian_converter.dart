import 'dart:convert';

import 'package:edusys_client/data/models/guardian_model.dart';
import 'package:edusys_client/domain/converters/address_converter.dart';
import 'package:edusys_client/domain/entities/guardian_entity.dart';

class GuardianConverter extends Converter<GuardianModel, GuardianEntity> {
  final AddressConverter addressConverter = AddressConverter();

  @override
  GuardianEntity convert(GuardianModel input) {
    return GuardianEntity(
      id: input.id,
      name: input.name,
      address: addressConverter.convert(input.address),
      cpf: input.cpf,
      rg: input.rg,
      birthDate: input.birthDate,
      sex: input.sex,
      payer: input.payer,
      phone: input.phone,
      email: input.email,
    );
  }
}
