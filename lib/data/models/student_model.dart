import 'package:edusys_client/data/models/guardian_model.dart';
import 'package:edusys_client/enums/sex_enum.dart';

import 'address_model.dart';

class StudentModel {
  final int id;
  final String name;
  final DateTime birthDate;
  final String cpf;
  final String rg;
  final Sex sex;
  final String enrollment;
  final AddressModel address;
  final int classGroupId;
  final List<GuardianModel> guardians;

  StudentModel({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.cpf,
    required this.rg,
    required this.sex,
    required this.enrollment,
    required this.address,
    required this.classGroupId,
    required this.guardians,
  });

  // Método para converter de JSON para StudentModel
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'] as int,
      name: json['name'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      cpf: json['cpf'] as String,
      rg: json['rg'] as String,
      sex: Sex.values
          .firstWhere((e) => e.toString().split('.').last == json['sex']),
      enrollment: json['enrollment'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      classGroupId: json['classGroupId'] as int,
      guardians: List<GuardianModel>.from(json['guardians']),
    );
  }

  // Método para converter StudentModel para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'birthDate': birthDate.toIso8601String(),
      'cpf': cpf,
      'rg': rg,
      'sex': sex.toString().split('.').last,
      'enrollment': enrollment,
      'address': address.toJson(),
      'classGroupId': classGroupId,
      'guardians': guardians,
    };
  }
}
