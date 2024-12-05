import 'package:edusys_client/data/models/contract_model.dart';
import 'package:edusys_client/data/models/guardian_model.dart';
import 'package:edusys_client/data/models/student_model.dart';
import 'package:edusys_client/enums/tuition_fee_status.dart';

class TuitionFeeModel {
  final int id;
  final DateTime dueDate;
  final double discountPercentage;
  final double baseValue;
  final double finalValue;
  final DateTime paymentDate;
  final TuitionFeeStatus paymentStatus;
  final StudentModel student;
  final GuardianModel guardian;
  final ContractModel contract;

  TuitionFeeModel(
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

  factory TuitionFeeModel.fromJson(Map<String, dynamic> json) {
    return TuitionFeeModel(
      id: json['id'],
      dueDate: DateTime.parse(json['due_date']),
      discountPercentage: json['discount_percentage'],
      baseValue: json['base_value'],
      finalValue: json['final_value'],
      paymentDate: DateTime.parse(json['payment_date']),
      paymentStatus: TuitionFeeStatus.values[json['payment_status']],
      student: StudentModel.fromJson(json['student']),
      guardian: GuardianModel.fromJson(json['guardian']),
      contract: ContractModel.fromJson(json['contract']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'due_date': dueDate.toIso8601String(),
      'discount_percentage': discountPercentage,
      'base_value': baseValue,
      'final_value': finalValue,
      'payment_date': paymentDate.toIso8601String(),
      'payment_status': paymentStatus.index,
      'student': student.toJson(),
      'guardian': guardian.toJson(),
      'contract': contract.toJson(),
    };
  }
}
