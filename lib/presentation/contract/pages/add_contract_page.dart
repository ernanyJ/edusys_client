import 'package:brasil_fields/brasil_fields.dart';
import 'package:edusys_client/presentation/contract/widgets/guardian_add/add_guardian_state.dart';
import 'package:edusys_client/presentation/contract/widgets/student_add/add_student_dialog.dart';
import 'package:edusys_client/presentation/contract/widgets/student_add/create_student_dialog_state.dart';
import 'package:edusys_client/presentation/contract/widgets/guardian_add/add_guardian_dialog.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ContractAddPage extends StatelessWidget {
  const ContractAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SingleChildScrollView(
        child: Padding(
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
                suffixIcon: Icon(Icons.search, color: neutralColor),
                actions: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AddStudentDialog(),
                      );
                    },
                    child: const Text('Adicionar'),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<CreateStudentDialogState>().clear();
                    },
                    child: const Text('Limpar'),
                  ),
                ],
                label: 'Estudante',
                controller: TextEditingController()
                  ..text = context
                          .watch<CreateStudentDialogState>()
                          .currentStudent
                          ?.name ??
                      '',
              ),
              const SizedBox(height: defaultInnerPad),
              Text(
                'Valores:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
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
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d{1,2}$|^100$')),
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              Wrap(
                children: [
                  MyTextField(
                    suffixIcon: const Icon(Icons.calendar_today),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DataInputFormatter(),
                    ],
                    scaleFactor: 0.22,
                    label: 'Data de início *',
                    controller: TextEditingController(),
                  ),
                  MyTextField(
                    suffixIcon: const Icon(Icons.calendar_today),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: defaultInnerPad,
                children: [
                  IconButton(
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Adicionar responsáveis',
                            style:
                                TextStyle(fontSize: 18, color: neutralColor)),
                        const SizedBox(width: 5),
                        Icon(Icons.add, color: primaryColor),
                      ],
                    ),
                    onPressed: () {
                      var state = context.read<AddGuardianState>();

                      if (state.guardianNameController.text == '') {
                        state.currentSexSelected = null;
                      }

                      showDialog(
                          context: context,
                          builder: (context) => const AddGuardianDialog());
                    },
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount:
                        context.watch<AddGuardianState>().guardians.length,
                    itemBuilder: (context, index) {
                      final guardian =
                          context.watch<AddGuardianState>().guardians[index];
                      return ListTile(
                        onTap: () {
                          context
                              .read<AddGuardianState>()
                              .setUpControllers(guardian, index);

                          context.read<AddGuardianState>().currentSexSelected =
                              guardian.sex;

                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => AddGuardianDialog(
                              guardian: guardian,
                              index: index,
                            ),
                          );
                        },
                        leading: const Icon(Icons.person),
                        title: Text(guardian.name),
                        subtitle: Text(guardian.cpf),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {},
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
