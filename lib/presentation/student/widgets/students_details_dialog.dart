import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:flutter/material.dart';

class StudentsDetailsDialog extends StatelessWidget {
  const StudentsDetailsDialog({
    super.key,
    required this.student,
  });

  final StudentEntity student;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Detalhes do estudante'),
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${student.name}'),
            Text('Turma: ${student.classGroup.room}'),
            Text(
                'Mensalidade atual: ${student.currentMonthPaid?.value ?? 'Não possui'}'),
            Text('CPF: ${student.cpf}'),
            Text('Responsável: ${student.guardians.first.name}'),
            Text('Matrícula: ${student.enrollment}'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Fechar'),
        ),
      ],
    );
  }
}
