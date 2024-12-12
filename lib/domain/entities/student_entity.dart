import 'package:edusys_client/data/models/in/student_model_in.dart';
import 'package:edusys_client/data/models/out/student_model_out.dart';
import 'package:edusys_client/domain/entities/address_entity.dart';
import 'package:edusys_client/domain/entities/class_group_entity.dart';
import 'package:edusys_client/domain/entities/guardian_entity.dart';
import 'package:edusys_client/enums/sex_enum.dart';
import 'package:edusys_client/enums/tuition_fee_status.dart';

class StudentEntity {
  final int id;
  final String name;
  final DateTime birthDate;
  final String cpf;
  final String rg;
  final Sex sex;
  final String enrollment;
  final AddressEntity address;
  final ClassGroupEntity classGroup;
  final List<GuardianEntity> guardians;
  final TuitionFeeStatus? currentMonthPaid;

  StudentEntity({
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

}
