import 'package:edusys_client/core/config/config_entity.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/presentation/class_group/details/class_group_details_state.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassMovementDialog extends StatelessWidget {
  const ClassMovementDialog({
    super.key,
    required this.state,
    required this.onPressed,
    required this.student,
  });

  final ClassGroupDetailsState state;
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
    
          // drop down
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Text('Selecione a nova turma:'),
                DropdownButton<String>(
                  value: context
                      .watch<ClassGroupDetailsState>()
                      .selectedClass,
                  alignment: Alignment.centerRight,
                  items: [
                    ...state.classes.map((e) => DropdownMenuItem(
                          value: e.id.toString(),
                          child: Text(e.name),
                        ))
                  ],
                  onChanged: (value) {
                    state.setSelectedClass(value);
                  },
                ),
                Visibility(
                    visible: context
                            .watch<ClassGroupDetailsState>()
                            .selectedClass ==
                        null,
                    child: Text('Selecione uma turma.',
                        style: TextStyle(color: dangerColor))),
              ],
            ),
          ),
          Form(
            key: context
                .read<ClassGroupDetailsState>()
                .moveStudentClassGroupKey,
            child: Column(
              children: [
                MyTextField(
                  validation: (p0) => p0 == null || p0.isEmpty
                      ? 'Justificativa é obrigatória'
                      : null,
                  label: 'Justificativa *',
                  controller: context
                      .read<ClassGroupDetailsState>()
                      .justifyController,
                ),
                Visibility(
                  visible: ConfigSingleton.getInstance()
                      .askPasswordForClassChange,
                  child: MyTextField(
                    validation: (value) {
                      var config = ConfigSingleton.getInstance();
    
                      if (config.askPasswordForClassChange &&
                          value != config.securityPassword) {
                        return 'Senha incorreta';
                      }
                      return null;
                    },
                    label: 'Senha *',
                    controller: context
                        .read<ClassGroupDetailsState>()
                        .askPasswordController,
                  ),
                ),
              ],
            ),
          ),
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

class EditButton extends StatelessWidget {
  const EditButton(
    this.onPressed, {
    super.key,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
      ),
      child: Text(
        'Salvar alterações',
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
