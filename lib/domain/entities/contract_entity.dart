import 'package:edusys_client/domain/entities/guardian_entity.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/enums/contract_status_enum.dart';

class ContractEntity {
  final int id;
  final DateTime startDate;
  final DateTime endDate;
  final ContractStatusEnum status;
  final StudentEntity student;
  final GuardianEntity guardian;

  ContractEntity(
      {required this.id,
      required this.startDate,
      required this.endDate,
      required this.status,
      required this.student,
      required this.guardian});
}
