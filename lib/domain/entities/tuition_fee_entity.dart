import 'package:edusys_client/enums/tuition_fee_status.dart';

class TuitionFeeEntity {
  final int id;
  final DateTime dueDate;
  final double discountPercentage;
  final double baseValue;
  final double finalValue;
  final DateTime? paymentDate;
  final TuitionFeeStatus status;

  TuitionFeeEntity({
    required this.id,
    required this.dueDate,
    required this.discountPercentage,
    required this.baseValue,
    required this.finalValue,
    required this.paymentDate,
    required this.status,
  });
}
