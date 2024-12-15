import 'package:flutter/material.dart';

enum ContractStatusEnum {
  ACTIVE("Ativo", Color.fromARGB(255, 49, 139, 52)), INACTIVE("Inativo", Color.fromARGB(255, 245, 215, 46)), CANCELLED("Cancelado", Color.fromARGB(255, 219, 56, 45));

  final String value;
  final Color color;
  const ContractStatusEnum(this.value, this.color);
}