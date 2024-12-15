import 'package:edusys_client/presentation/contract/widgets/create_student_dialog.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class ContractAddPage extends StatelessWidget {
  const ContractAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultMainPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Adicionar contrato',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Wrap(
            children: [
              MyTextField(
                readOnly: true,
                actions: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const CreateStudentDialog(),
                      );
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
                label: 'Estudante',
                controller: TextEditingController(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
