import 'package:edusys_client/core/pickers/color_picker.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/domain/entities/tuition_fee_entity.dart';
import 'package:edusys_client/presentation/student/state/fee_visualizer_state.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeeVisualizer extends StatelessWidget {
  const FeeVisualizer({super.key, required this.student});

  final StudentEntity student;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<FeeVisualizerState>(context);
    return SizedBox(
      height: 250,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text('Mensalidades:',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 23)),
              Text(
                  'Dia do vencimento: ${state.tuitionFees.isEmpty ? '' : state.tuitionFees.first.dueDate.day}',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 15)),
              const SizedBox(height: defaultInnerPad),
            ],
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...state.tuitionFees.map((e) => MonthFee(e)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MonthFee extends StatelessWidget {
  const MonthFee(
    this.fee, {
    super.key,
  });

  final TuitionFeeEntity fee;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${getDateMonth(fee.dueDate)}/${fee.dueDate.year - 2000}',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.black)),
        Padding(
          padding: const EdgeInsets.all(defaultInnerPad),
          child: Container(
            decoration: BoxDecoration(
                color: colorPicker(fee.status),
                borderRadius: BorderRadius.circular(15)),
            width: 100,
            height: 150,
            child: Center(
              child: Text(
                fee.status.value,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getDateMonth(DateTime date) {
    switch (date.month) {
      case 1:
        return '01';
      case 2:
        return '02';
      case 3:
        return '03';
      case 4:
        return '04';
      case 5:
        return '05';
      case 6:
        return '06';
      case 7:
        return '07';
      case 8:
        return '08';
      case 9:
        return '09';
      case 10:
        return '10';
      case 11:
        return '11';
      case 12:
        return '12';
      default:
        return '';
    }
  }
}
