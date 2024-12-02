import 'package:edusys_client/domain/entities/address_entity.dart';
import 'package:edusys_client/enums/sex_enum.dart';

class GuardianEntity {
  final int id;
  final String name;
  final String cpf;
  final String rg;
  final Sex sex;
  final DateTime birthDate;
  final bool payer;
  final String phone;
  final String? secondPhone;
  final String email;
  final AddressEntity address;

  GuardianEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.rg,
    required this.sex,
    required this.birthDate,
    required this.payer,
    required this.phone,
    this.secondPhone,
    required this.email,
    required this.address,
  });
}
