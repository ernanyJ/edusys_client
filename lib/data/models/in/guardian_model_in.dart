import 'package:edusys_client/enums/sex_enum.dart';

import 'address_model_in.dart';

class GuardianModel {
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
  final AddressModel address;

  GuardianModel({
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

  // Método para converter de JSON para GuardianModel
  factory GuardianModel.fromJson(Map<String, dynamic> json) {
    return GuardianModel(
      id: json['id'] as int,
      name: json['name'] as String,
      cpf: json['cpf'] as String,
      rg: json['rg'] as String,
      sex: Sex.values.firstWhere((e) => e.toString().split('.').last == json['sex']),
      birthDate: DateTime.parse(json['birthDate'] as String),
      payer: json['payer'] as bool,
      phone: json['phone'] as String,
      secondPhone: json['secondPhone'] as String?,
      email: json['email'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
    );
  }

  // Método para converter GuardianModel para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cpf': cpf,
      'rg': rg,
      'sex': sex.toString().split('.').last,
      'birthDate': birthDate.toIso8601String(),
      'payer': payer,
      'phone': phone,
      'secondPhone': secondPhone,
      'email': email,
      'address': address.toJson(),
    };
  }
}
