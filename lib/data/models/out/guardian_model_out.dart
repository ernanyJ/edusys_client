import 'package:edusys_client/data/models/out/address_model_out.dart';
import 'package:edusys_client/enums/sex_enum.dart';

class GuardianModelOut {
  final String name;
  final String cpf;
  final String? rg;
  final Sex sex;
  final String birthDate;
  final bool payer;
  final String? phone;
  final String? secondPhone;
  final String? email;
  final AddressModelOut address;

  GuardianModelOut({
    required this.name,
    required this.cpf,
    this.rg,
    required this.sex,
    required this.birthDate,
    required this.payer,
    this.phone,
    this.secondPhone,
    this.email,
    required this.address,
  });


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cpf': cpf,
      'rg': rg,
      'sex': sex.toString().split('.').last,
      'birthDate': birthDate,
      'payer': payer,
      'phone': phone,
      'secondPhone': secondPhone,
      'email': email,
      'address': address.toJson(),
    };
  }
}
