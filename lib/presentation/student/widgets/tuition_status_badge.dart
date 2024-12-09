import 'package:edusys_client/core/pickers/color_picker.dart';
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




}
