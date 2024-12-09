import 'dart:convert';

import 'package:edusys_client/data/models/in/address_model_in.dart';
import 'package:edusys_client/domain/entities/address_entity.dart';

class AddressConverter extends Converter<AddressModel, AddressEntity> {
  @override
  AddressEntity convert(AddressModel input) {
    return AddressEntity(
        id: input.id,
        street: input.street,
        city: input.city,
        state: input.state,
        zipCode: input.zipCode,
        country: input.country,
        number: input.number,
        complement: input.complement,
        neighborhood: input.neighborhood,
        reference: input.reference);
  }
}
