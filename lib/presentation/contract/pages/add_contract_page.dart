import 'package:brasil_fields/brasil_fields.dart';
import 'package:edusys_client/presentation/contract/widgets/create_student_dialog.dart';
import 'package:edusys_client/presentation/guardian/widget/add_guardian_dialog.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          MyTextField(
            scaleFactor: 0.22,
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
          const SizedBox(height: defaultInnerPad),
          Text(
            'Valores:',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
          ),
          Row(
            children: [
              MyTextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CentavosInputFormatter(),
                ],
                scaleFactor: 0.22,
                label: 'Valor da mensalidade *',
                controller: TextEditingController(),
              ),
              MyTextField(
                suffix: const Text('%'),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d{1,2}$|^100$')),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                scaleFactor: 0.22,
                label: 'Porcentagem de desconto *',
                controller: TextEditingController(),
              ),
            ],
          ),
          const SizedBox(height: defaultInnerPad),
          Text(
            'Vigência:',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
          ),
          Wrap(
            children: [
              MyTextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter(),
                ],
                scaleFactor: 0.22,
                label: 'Data de início *',
                controller: TextEditingController(),
              ),
              MyTextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter(),
                ],
                scaleFactor: 0.22,
                label: 'Data de finalização *',
                controller: TextEditingController(),
              ),
            ],
          ),
          Column(
            spacing: defaultInnerPad,
            children: [
              IconButton(
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Adicionar responsáveis',
                        style: TextStyle(fontSize: 18, color: neutralColor)),
                    const SizedBox(width: 5),
                    Icon(Icons.add, color: primaryColor),
                  ],
                ),
                onPressed: () {
                  showDialog(context: context, builder: (context) => const AddGuardianDialog());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
