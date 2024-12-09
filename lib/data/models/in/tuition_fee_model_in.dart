import 'package:edusys_client/enums/tuition_fee_status.dart';

class TuitionFeeModel {
  final int id;
  final DateTime dueDate;
  final double discountPercentage;
  final double baseValue;
  final double finalValue;
  final DateTime? paymentDate;
  final TuitionFeeStatus status;

  TuitionFeeModel({
    required this.id,
    required this.dueDate,
    required this.discountPercentage,
    required this.baseValue,
    required this.finalValue,
    required this.paymentDate,
    required this.status,
  });

  factory TuitionFeeModel.fromJson(Map<String, dynamic> json) {
    return TuitionFeeModel(
      id: json['id'],
      dueDate: DateTime.parse(json['dueDate']),
      discountPercentage: json['discountPercentage'],
      baseValue: json['baseValue'],
      finalValue: json['finalValue'],
      paymentDate: json['paymentDate'] != null
          ? DateTime.parse(json['paymentDate'])
          : null,
      status:
          TuitionFeeStatus.values.firstWhere((e) => e.name == json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'due_date': dueDate.toIso8601String(),
      'discount_percentage': discountPercentage,
      'base_value': baseValue,
      'final_value': finalValue,
      'payment_date': paymentDate?.toIso8601String() ?? '',
      'payment_status': status.index,
    };
  }
}
