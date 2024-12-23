import 'package:edusys_client/data/models/in/class_group_model_in.dart';
import 'package:edusys_client/data/models/in/guardian_model_in.dart';
import 'package:edusys_client/enums/sex_enum.dart';
import 'package:edusys_client/enums/tuition_fee_status.dart';

import 'address_model_in.dart';

class StudentModelIn {
  final int id;
  final String name;
  final DateTime birthDate;
  final String cpf;
  final String rg;
  final Sex sex;
  final String? enrollment;
  final AddressModel address;
  final ClassGroupModelIn? classGroup;
  final List<GuardianModel> guardians;
  final TuitionFeeStatus? currentMonthPaid;

  StudentModelIn({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.cpf,
    required this.rg,
    required this.sex,
    required this.enrollment,
    required this.address,
    required this.classGroup,
    required this.guardians,
    required this.currentMonthPaid,
  });

  // Método para converter de JSON para StudentModel
  factory StudentModelIn.fromJson(Map<String, dynamic> json) {
    return StudentModelIn(
        id: json['id'] as int,
        name: json['name'] as String,
        birthDate: DateTime.parse(json['birthDate'] as String),
        cpf: json['cpf'] as String,
        rg: json['rg'] as String,
        sex: Sex.values
            .firstWhere((e) => e.toString().split('.').last == json['sex']),
        enrollment: json['enrollment'] as String?,
        address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
        classGroup: json['classGroup'] != null
            ? ClassGroupModelIn.fromJson(json['classGroup'] as Map<String, dynamic>)
            : null,
        guardians: (json['guardians'] as List)
            .map((item) => GuardianModel.fromJson(item as Map<String, dynamic>))
            .toList(),
        currentMonthPaid: json['currentMonthPaid'] != null
            ? TuitionFeeStatus.values.firstWhere(
                (e) => e.toString().split('.').last == json['currentMonthPaid'])
            : null);
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
      'classGroupId': classGroup,
      'guardians': guardians,
      'currentMonthPaid': currentMonthPaid,
    };
  }
}
