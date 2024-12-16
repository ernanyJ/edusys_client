import 'package:edusys_client/data/models/in/address_model_in.dart';
import 'package:edusys_client/data/models/out/address_model_out.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/enums/sex_enum.dart';

class StudentModelOut {
  final String name;
  final String birthDate;
  final String cpf;
  final String rg;
  final Sex sex;
  final String enrollmentId;
  final Set<int> guardianId;
  final int? classGroupId;
  final AddressModelOut address;

  StudentModelOut(
      {required this.name,
      required this.birthDate,
      required this.cpf,
      required this.rg,
      required this.sex,
      required this.enrollmentId,
      required this.guardianId,
      required this.classGroupId,
      required this.address});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'birthDate': birthDate,
      'cpf': cpf,
      'rg': rg,
      'sex': sex.toString().split('.').last,
      'enrollment': enrollmentId,
      'classGroupId': classGroupId,
      'guardians': guardianId.toList(),
      'address': address.toJson(),
    };
  }

  factory StudentModelOut.fromEntity(StudentEntity entity) {
    return StudentModelOut(
        name: entity.name,
        birthDate: entity.birthDate.toIso8601String().split('T').first,
        cpf: entity.cpf,
        rg: entity.rg,
        sex: entity.sex,
        enrollmentId: entity.enrollment,
        guardianId: entity.guardians.map((e) => e.id).toSet(),
        classGroupId: entity.classGroup.id,
        address: AddressModelOut(
            street: entity.address.street,
            city: entity.address.city,
            state: entity.address.state,
            zipCode: entity.address.zipCode,
            country: entity.address.country,
            number: entity.address.number,
            complement: entity.address.complement,
            neighborhood: entity.address.neighborhood,
            reference: entity.address.reference));
  }
}
