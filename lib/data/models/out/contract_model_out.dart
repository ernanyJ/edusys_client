import 'package:edusys_client/data/models/out/guardian_model_out.dart';
import 'package:edusys_client/data/models/out/student_contract_model_out.dart';

class ContractModelOut {
  ContractModelOut({
    required this.startDate,
    required this.endDate,
    required this.student,
    required this.guardians,
    required this.feeValue,
    required this.discountPercentage,
    required this.dueDay,
  });

  final DateTime startDate;
  final DateTime endDate;
  final StudentContractModelOut student;
  final Set<GuardianModelOut> guardians;
  final double feeValue;
  final double discountPercentage;
  final int dueDay;

  Map<String, dynamic> toJson() {
    return {
      'startDate': startDate,
      'endDate': endDate,
      'student': student.toJson(),
      'guardians': guardians.map((e) => e.toJson()).toList(),
      'feeValue': feeValue,
      'discountPercentage': discountPercentage,
      'dueDay': dueDay,
    };
  }
}
