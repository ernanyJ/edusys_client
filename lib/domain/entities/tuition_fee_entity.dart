import 'package:edusys_client/domain/entities/contract_entity.dart';
import 'package:edusys_client/domain/entities/guardian_entity.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/enums/tuition_fee_status.dart';

class TuitionFeeEntity {
  final int id;
  final DateTime dueDate;
  final double discountPercentage;
  final double baseValue;
  final double finalValue;
  final DateTime? paymentDate;
  final TuitionFeeStatus paymentStatus;
  final StudentEntity student;
  final GuardianEntity guardian;
  final ContractEntity contract;

  TuitionFeeEntity(
      {required this.id,
      required this.dueDate,
      required this.discountPercentage,
      required this.baseValue,
      required this.finalValue,
      required this.paymentDate,
      required this.paymentStatus,
      required this.student,
      required this.guardian,
      required this.contract});
}
