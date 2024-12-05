import 'package:edusys_client/data/models/guardian_model.dart';
import 'package:edusys_client/data/models/student_model.dart';
import 'package:edusys_client/enums/contract_status_enum.dart';

class ContractModel {
  final int id;
  final DateTime startDate;
  final DateTime endDate;
  final ContractStatusEnum status;
  final StudentModel student;
  final GuardianModel guardian;

  ContractModel(
      {required this.id,
      required this.startDate,
      required this.endDate,
      required this.status,
      required this.student,
      required this.guardian});

  factory ContractModel.fromJson(Map<String, dynamic> json) {
    return ContractModel(
      id: json['id'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      status: ContractStatusEnum.values[json['status']],
      student: StudentModel.fromJson(json['student']),
      guardian: GuardianModel.fromJson(json['guardian']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'status': status.index,
      'student': student.toJson(),
      'guardian': guardian.toJson(),
    };
  }
}
