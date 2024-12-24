import 'package:brasil_fields/brasil_fields.dart';
import 'package:edusys_client/data/models/out/guardian_model_out.dart';
import 'package:edusys_client/enums/sex_enum.dart';
import 'package:edusys_client/exceptions/invalid_input.dart';
import 'package:edusys_client/presentation/contract/widgets/guardian_add/add_guardian_state.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/presentation/widgets/sex_dropdown.dart';
import 'package:edusys_client/presentation/widgets/states_dropdown.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

const double scale = 0.20;

class AddGuardianDialog extends StatefulWidget {
  const AddGuardianDialog({super.key, this.guardian, this.index});

  final GuardianModelOut? guardian;
  final int? index;

  @override
  State<AddGuardianDialog> createState() => _AddGuardianDialogState();
}

class _AddGuardianDialogState extends State<AddGuardianDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.6,
        child: const SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(left: defaultMainPad, right: defaultMainPad),
            child: _PrivateInfoFields(),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            var state = context.read<AddGuardianState>();

            if (widget.guardian != null && widget.index != null) {
              state.clearControllers();
            }
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            try {
              context.read<AddGuardianState>().validateControllers();
            } on InvalidInput catch (e) {
              // Use a Builder widget to ensure the snackbar shows on top of the dialog
              ScaffoldMessenger.of(context).hideCurrentSnackBar();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.message),
                  backgroundColor: dangerColor,
                ),
              );
              return;
            }
            if (widget.guardian != null && widget.index != null) {
              try {
                context.read<AddGuardianState>().updateGuardian(widget.index!);
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
            } else {
              try {
                context.read<AddGuardianState>().addGuardian();
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
            }

            Navigator.pop(context);
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}

class _PrivateInfoFields extends StatefulWidget {
  const _PrivateInfoFields();

  @override
  State<_PrivateInfoFields> createState() => _PrivateInfoFieldsState();
}

class _PrivateInfoFieldsState extends State<_PrivateInfoFields> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AddGuardianState>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: defaultInnerPad,
      children: [
        Text(
          'Informações pessoais:',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
        ),
        Wrap(
          spacing: defaultInnerPad,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            MyTextField(
                isRequired: true,
                scaleFactor: scale,
                label: 'Nome *',
                controller: state.guardianNameController),
            MyTextField(
              scaleFactor: scale,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
              label: 'CPF *',
              controller: state.guardianCpfController,
              isRequired: true,
            ),
            Column(
              children: [
                const SizedBox(height: 9),
                SexDropdown(
                  initialValue: state.currentSexSelected,
                  onChanged: (Sex? value) {
                    state.currentSexSelected = value;
                  },
                ),
              ],
            ),
            MyTextField(
              isRequired: true,
              scaleFactor: scale,
              label: 'RG',
              controller: state.guardianRgController,
            ),
            MyTextField(
                isRequired: true,
                scaleFactor: scale,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter(),
                ],
                label: 'Data de nascimento *',
                controller: state.guardianBirthDateController),
            MyTextField(
                isRequired: true,
                validation: (p0) =>
                    p0!.contains('@') ? null : 'Insira um e-mail válido.',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')),
                ],
                scaleFactor: scale,
                label: 'Email *',
                controller: state.guardianEmailController),
            MyTextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                scaleFactor: scale,
                isRequired: true,
                label: 'Celular *',
                controller: state.guardianPhoneController),
            MyTextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                scaleFactor: scale,
                label: 'Celular secundário',
                controller: state.guardianSecondaryPhoneController),
          ],
        ),
        PagadorRadio(
          payer: state.isPayer ? 1 : 0,
          onChanged: (value) {
            setState(() {
              state.isPayer = value == 1;
            });
          },
        ),
        const _AddressFieds(),
      ],
    );
  }
}

class _AddressFieds extends StatelessWidget {
  const _AddressFieds();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AddGuardianState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Endereço:',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
        ),
        Wrap(
          children: [
            MyTextField(
              isRequired: true,
              label: 'Rua *',
              controller: state.guardianStreetController,
            ),
            MyTextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              isRequired: true,
              label: 'Número *',
              controller: state.guardianNumberController,
            ),
            MyTextField(
              isRequired: true,
              label: 'Complemento *',
              controller: state.guardianComplementController,
            ),
            MyTextField(
              isRequired: true,
              label: 'Bairro *',
              controller: state.guardianNeighborhoodController,
            ),
            MyTextField(
                isRequired: true,
                label: 'Cidade *',
                controller: state.guardianCityController),
            Column(
              children: [
                const SizedBox(height: 31),
                StatesDropdown(
                  onChanged: (value) => state.guardianStateController.text = value as String,
                ),
              ],
            ),
            MyTextField(
                isRequired: true,
                label: 'CEP *',
                controller: state.guardianZipCodeController),
            MyTextField(
                isRequired: true,
                label: 'País *',
                controller: state.guardianCountryController),
            MyTextField(
              label: 'Referência',
              controller: state.guardianReferenceController,
            ),
          ],
        ),
      ],
    );
  }
}

class PagadorRadio extends StatefulWidget {
  @override
  State<PagadorRadio> createState() => _PagadorRadioState();

  final Object? payer;

  final ValueChanged<Object?> onChanged;

  const PagadorRadio({super.key, required this.onChanged, required this.payer});
}

class _PagadorRadioState extends State<PagadorRadio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Pagador', style: TextStyle(color: neutralColor)),
        ),
        Row(
          children: [
            Radio(
              activeColor: primaryColor,
              value: 1,
              groupValue: widget.payer,
              onChanged: (value) {
                widget.onChanged(value);
              },
            ),
            const Text('Sim'),
            Radio(
                activeColor: primaryColor,
                value: 0,
                groupValue: widget.payer,
                onChanged: (value) {
                  widget.onChanged(value);
                }),
            const Text('Não'),
          ],
        ),
      ],
    );
  }
}
