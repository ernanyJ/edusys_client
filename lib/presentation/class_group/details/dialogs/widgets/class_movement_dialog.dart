import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/presentation/class_group/details/class_group_details_state.dart';
import 'package:edusys_client/presentation/class_group/details/dialogs/widgets/classes_dropdown_widget.dart';
import 'package:edusys_client/presentation/class_group/details/dialogs/widgets/fields_student_move_widget.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassMovementDialog extends StatelessWidget {
  const ClassMovementDialog({
    super.key,
    required this.onPressed,
    required this.student,
  });

  final void Function() onPressed;
  final StudentEntity student;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Movimentação de turma'),
      content: Column(
        spacing: defaultInnerPad,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: defaultMainPad),
          Text(
            'Ao mover o estudante de turma, ele será removido da turma atual e adicionado a uma nova turma.',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: dangerColor,
                ),
          ),
          const ClassesDropdownWidget(),
          const FieldsStudentMoveWidget(),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            onPressed();

            try {
              context
                  .read<ClassGroupDetailsState>()
                  .moveStudentClassGroup(student.id);

              Navigator.of(context).pop();
              Navigator.of(context).pop();
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Erro ao mover aluno de turma: $e'),
                backgroundColor: dangerColor,
              ));
            }
          },
          child: const Text('Concluir'),
        ),
      ],
    );
  }
}
