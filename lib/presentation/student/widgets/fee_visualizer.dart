import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/presentation/student/state/fee_visualizer_state.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeeVisualizer extends StatelessWidget {
  const FeeVisualizer({super.key, required this.student});

  final StudentEntity student;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.maxFinite,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: (){
              Provider.of<FeeVisualizerState>(context, listen: false)
                  .getTuitionFeesFromStudent(student.id);
            },
            child: MonthFee(),
          ),
          const MonthFee(),
          const MonthFee(),
          const MonthFee(),
          const MonthFee(),
          const MonthFee(),
          const MonthFee(),
          const MonthFee(),
          const MonthFee(),
          const MonthFee(),
          const MonthFee(),
        ],
      ),
    );
  }
}

class MonthFee extends StatelessWidget {
  const MonthFee({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Janeiro',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.black)),
        Padding(
          padding: const EdgeInsets.all(defaultInnerPad),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.circular(15)),
            width: 100,
            height: 150,
            child: Center(
                child: Text('Atrasado',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white))),
          ),
        ),
      ],
    );
  }
}
