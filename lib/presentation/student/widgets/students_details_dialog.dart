import 'package:brasil_fields/brasil_fields.dart';
import 'package:edusys_client/core/formaters.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/presentation/student/state/fee_visualizer_state.dart';
import 'package:edusys_client/presentation/student/state/student_page_state.dart';
import 'package:edusys_client/presentation/student/widgets/fee_visualizer.dart';
import 'package:edusys_client/presentation/student/widgets/tuition_status_badge.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class StudentsDetailsDialog extends StatelessWidget {
  const StudentsDetailsDialog({
    super.key,
    required this.student,
  });

  final StudentEntity student;

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<StudentPageState>(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) => FeeVisualizerState(student)..init(),
      child: Builder(builder: (context) {
        return AlertDialog(
          icon: Row(
            children: [
              Text(
                'Detalhes do estudante',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(
                width: defaultInnerPad + 12,
              ),
              const Spacer(),
              TuitionStatusBadge(tuitionFeeStatus: student.currentMonthPaid),
            ],
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.6,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: defaultMainPad, right: defaultMainPad),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Form(
                          child: MyTextField(
                            label: 'Nome',
                            controller:
                                TextEditingController(text: student.name),
                          ),
                        ),
                        const SizedBox(
                          width: defaultInnerPad,
                        ),
                        MyTextField(
                          label: 'Matricula',
                          controller:
                              TextEditingController(text: student.enrollment),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyTextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter(),
                          ],
                          label: 'CPF',
                          controller: TextEditingController(text: student.cpf),
                        ),
                        MyTextField(
                          label: 'RG',
                          controller: TextEditingController(text: student.rg),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyTextField(
                          label: 'Endereço',
                          controller: TextEditingController(
                              text: formatAddress(student.address)),
                        ),
                        MyTextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            DataInputFormatter(),
                          ],
                          label: 'Data de nascimento',
                          controller: TextEditingController(
                              text: formatDate(student.birthDate)),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultMainPad),
                    Row(
                      children: [
                        const Spacer(),
                        DeleteButton(
                          onPressed: () {
                            state.deleteStudent(student.id, context);
                          },
                          student: student.name,
                        ),
                        const SizedBox(width: defaultMainPad),
                        EditButton(() => state.updateStudent(student)),
                      ],
                    ),
                    const SizedBox(height: defaultMainPad),
                    FeeVisualizer(student: student),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton(
      {super.key, required this.onPressed, required this.student});

  final void Function() onPressed;
  final String student;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // dialog confirmando

        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Excluir estudante'),
                content: Text('Deseja realmente excluir $student?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () => {onPressed(), Navigator.of(context).pop()},
                    child: const Text('Excluir'),
                  ),
                ],
              );
            });
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(dangerColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text('Excluir estudante',
            style: Theme.of(context).textTheme.labelSmall),
      ),
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
