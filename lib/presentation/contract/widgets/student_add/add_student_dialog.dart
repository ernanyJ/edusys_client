import 'package:brasil_fields/brasil_fields.dart';
import 'package:edusys_client/enums/sex_enum.dart';
import 'package:edusys_client/exceptions/invalid_input.dart';
import 'package:edusys_client/presentation/contract/widgets/student_add/create_student_dialog_state.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/presentation/widgets/sex_dropdown.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

double scale = 0.20;

final formKey = GlobalKey<FormState>();
final addressKey = GlobalKey<FormState>();

class AddStudentDialog extends StatelessWidget {
  const AddStudentDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CreateStudentDialogState>(context);
    return AlertDialog(
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
                _PersonalData(state),
                _AddressData(state),
              ],
            ),
          ),
        ),
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
            formKey.currentState!.validate();
            addressKey.currentState!.validate();

            try {
              state.validateControllers();
            } on InvalidInput catch (e) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.message),
                  backgroundColor: dangerColor,
                ),
              );
              return;
            }

            state.createStudent();
            Navigator.of(context).pop();
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}

class _PersonalData extends StatelessWidget {
  const _PersonalData(this.state);

  final CreateStudentDialogState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Informações pessoais:',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
        ),
        Form(
          key: formKey,
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              MyTextField(
                  validation: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  scaleFactor: scale,
                  label: 'Nome *',
                  controller: state.nameController),
              MyTextField(
                isRequired: true,
                scaleFactor: scale,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                label: 'CPF *',
                controller: state.cpfController,
              ),
              MyTextField(
                  isRequired: true,
                  scaleFactor: scale,
                  label: 'RG *',
                  controller: state.rgController),
              MyTextField(
                isRequired: true,
                scaleFactor: scale,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter(),
                ],
                label: 'Data de nascimento *',
                controller: state.birthDateController,
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  const SizedBox(height: 9),
                  SexDropdown(
                    initialValue: state.currentStudent?.sex,
                    onChanged: (Sex? value) {
                      state.sex = value!;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AddressData extends StatelessWidget {
  const _AddressData(this.state);
  final CreateStudentDialogState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Endereço:',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
        ),
        Form(
          key: addressKey,
          child: Wrap(
            children: [
              MyTextField(
                isRequired: true,
                label: 'Rua *',
                controller: state.streetController,
              ),
              MyTextField(
                isRequired: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                label: 'Número *',
                controller: state.numberController,
              ),
              MyTextField(
                isRequired: true,
                label: 'Complemento *',
                controller: state.complementController,
              ),
              MyTextField(
                isRequired: true,
                label: 'Bairro *',
                controller: state.neighborhoodController,
              ),
              MyTextField(
                  isRequired: true,
                  label: 'Cidade *',
                  controller: state.cityController),
              MyTextField(
                  isRequired: true,
                  label: 'Estado *',
                  controller: state.stateController),
              MyTextField(
                isRequired: true,
                inputFormatters: [
                  CepInputFormatter(),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                label: 'CEP *',
                controller: state.zipCodeController,
              ),
              MyTextField(
                  isRequired: true,
                  label: 'País *',
                  controller: state.countryController),
              MyTextField(
                label: 'Referência',
                controller: state.referenceController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
