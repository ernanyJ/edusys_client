import 'package:edusys_client/enums/tuition_fee_status.dart';
import 'package:flutter/material.dart';

class TuitionStatusBadge extends StatefulWidget {
  const TuitionStatusBadge({
    super.key,
    required this.tuitionFeeStatus,
  });

  final TuitionFeeStatus? tuitionFeeStatus;

  @override
  State<TuitionStatusBadge> createState() => _TuitionStatusBadgeState();
}

class _TuitionStatusBadgeState extends State<TuitionStatusBadge> {
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 1.5,
          color: colorPicker(widget.tuitionFeeStatus),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: textPicker(widget.tuitionFeeStatus),
      ),
    );
  }

  Text textPicker(TuitionFeeStatus? status) {
    if (status == TuitionFeeStatus.PAID) {
      return const Text('Mensalidade paga', style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600));
    } else if (status == TuitionFeeStatus.PENDING) {
      return const Text('Mensalidade pendente',  style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w600));
    } else if (status == TuitionFeeStatus.LATE) {
      return const Text('Mensalidade atrasada',  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600));
    } else {
      return const Text('Não possui mensalidade',  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600));
    }
  }

  Color colorPicker(TuitionFeeStatus? status) {
    if (status == TuitionFeeStatus.PAID) {
      return Colors.green;
    } else if (status == TuitionFeeStatus.PENDING) {
      return Colors.yellow;
    } else if (status == TuitionFeeStatus.LATE) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }
}
