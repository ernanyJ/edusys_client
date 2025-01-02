import 'package:edusys_client/presentation/student/widgets/count_card.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class StudentCountCardsRow extends StatelessWidget {
  const StudentCountCardsRow({
    super.key,
    required this.studentCount,
    required this.studentDebtCount,
  });

  final int studentCount;
  final int studentDebtCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: defaultInnerPad,
      children: [
        CountCard(
            color: Colors.blue,
            label: 'Total de estudantes',
            info: studentCount.toString()),
        CountCard(
            color: dangerColor,
            label: 'Mensalidades atrasadas',
            info: studentDebtCount.toString()),
      ],
    );
  }
}
