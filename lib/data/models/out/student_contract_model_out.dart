import 'package:edusys_client/data/models/out/address_model_out.dart';
import 'package:edusys_client/enums/sex_enum.dart';

class StudentContractModelOut {
  StudentContractModelOut(
      {required this.name,
      required this.birthDate,
      required this.cpf,
      required this.rg,
      required this.sex,
      required this.address});

  final String name;
  final DateTime birthDate;
  final String cpf;
  final String rg;
  final Sex sex;
  final AddressModelOut address;

 
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'birthDate': birthDate.toIso8601String().split('T').first,
      'cpf': cpf,
      'rg': rg,
      'sex': sex.toString().split('.').last,
      'address': address.toJson(),
    };
  }
}