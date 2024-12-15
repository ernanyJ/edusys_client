import 'package:edusys_client/data/models/in/guardian_model_in.dart';
import 'package:edusys_client/data/models/in/student_model_in.dart';
import 'package:edusys_client/enums/contract_status_enum.dart';

class ContractModel {
  final int id;
  final DateTime? startDate;
  final DateTime? endDate;
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
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      status: ContractStatusEnum.values.firstWhere(
          (e) => e.toString().split('.').last == json['status']),
      student: StudentModel.fromJson(json['student']),
      guardian: GuardianModel.fromJson(json['guardian']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'status': status.index,
      'student': student.toJson(),
      'guardian': guardian.toJson(),
    };
  }
}
