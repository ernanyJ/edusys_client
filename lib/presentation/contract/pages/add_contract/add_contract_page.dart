import 'package:brasil_fields/brasil_fields.dart';
import 'package:edusys_client/exceptions/invalid_input.dart';
import 'package:edusys_client/presentation/contract/pages/add_contract/add_contract_page_state.dart';
import 'package:edusys_client/presentation/contract/widgets/guardian_add/add_guardian_state.dart';
import 'package:edusys_client/presentation/contract/widgets/student_add/add_student_dialog.dart';
import 'package:edusys_client/presentation/contract/widgets/student_add/create_student_dialog_state.dart';
import 'package:edusys_client/presentation/contract/widgets/guardian_add/add_guardian_dialog.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

final contractDataKey = GlobalKey<FormState>();

class ContractAddPage extends StatelessWidget {
  const ContractAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        label: const Text('Salvar', style: TextStyle(color: Colors.white)),
        onPressed: () {
          if (context.read<AddGuardianState>().guardians.isEmpty) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Adicione ao menos um responsável'),
                backgroundColor: Colors.red,
              ),
            );
            return;
          }

          if (contractDataKey.currentState!.validate()) {
            try {
              var contractState = context.read<AddContractPageState>();

              contractState.validateData(context);

              // ENVIAR
              var guardiansState = context.read<AddGuardianState>();
              var studentState = context.read<CreateStudentDialogState>();

              var guardians = guardiansState.guardians.toSet();
              var student = studentState.currentStudent;

              contractState.addContract(guardians, student);

              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Contrato adicionado com sucesso'),
                  backgroundColor: successColor,
                ),
              );
              Navigator.of(context).pop();
              guardiansState.clearControllers();
              studentState.clear();
            } on InvalidInput catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.message),
                  backgroundColor: dangerColor,
                ),
              );
            }
          }
        },
      ),
      body: Builder(builder: (context) {
        var state = Provider.of<AddContractPageState>(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultMainPad),
            child: Form(
              key: contractDataKey,
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
                    isRequired: true,
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
                  Wrap(
                    children: [
                      MyTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CentavosInputFormatter(),
                        ],
                        scaleFactor: 0.22,
                        label: 'Valores *',
                        isRequired: true,
                        controller: state.monthlyValueController,
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
                        controller: state.discountController,
                      ),
                      MyTextField(
                        suffixIcon: const Icon(Icons.calendar_today),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^(?:[1-9]|[12][0-9]|3[01])$')),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        scaleFactor: 0.22,
                        label: 'Dia de cobrança *',
                        controller: state.dueDayController,
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
                        isRequired: true,
                        label: 'Data de início *',
                        controller: state.beginDateController,
                      ),
                      MyTextField(
                        suffixIcon: const Icon(Icons.calendar_today),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          DataInputFormatter(),
                        ],
                        scaleFactor: 0.22,
                        isRequired: true,
                        label: 'Data de finalização *',
                        controller: state.endDateController,
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
                                style: TextStyle(
                                    fontSize: 18, color: neutralColor)),
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
                          final guardian = context
                              .watch<AddGuardianState>()
                              .guardians[index];
                          return Material(
                            elevation: 2.0,
                            shadowColor: Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              tileColor:
                                  const Color.fromARGB(188, 255, 255, 255),
                              onTap: () {
                                context
                                    .read<AddGuardianState>()
                                    .setUpControllers(guardian, index);

                                context
                                    .read<AddGuardianState>()
                                    .currentSexSelected = guardian.sex;

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
                                onPressed: () {
                                  context
                                      .read<AddGuardianState>()
                                      .removeGuardian(index, context);
                                },
                              ),
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
          ),
        );
      }),
    );
  }
}
