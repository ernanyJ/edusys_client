import 'package:brasil_fields/brasil_fields.dart';
import 'package:edusys_client/data/models/out/guardian_model_out.dart';
import 'package:edusys_client/enums/sex_enum.dart';
import 'package:edusys_client/presentation/contract/widgets/guardian_add/add_guardian_state.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/presentation/widgets/sex_dropdown.dart';
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
            Navigator.of(context).pop();
            if (widget.guardian != null && widget.index != null) {
              context.read<AddGuardianState>().clearControllers();
            }
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            if (widget.guardian != null && widget.index != null) {
              context
                  .read<AddGuardianState>()
                  .guardians
                  .removeAt(widget.index!);
              context.read<AddGuardianState>().updateGuardian(widget.index!);
            }

            context.read<AddGuardianState>().addGuardian();

            Navigator.pop(context);
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}

class _PrivateInfoFields extends StatelessWidget {
  const _PrivateInfoFields();

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
          onChanged: (value) {},
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
            MyTextField(
                isRequired: true,
                label: 'Estado *',
                controller: state.guardianStateController),
            MyTextField(
                isRequired: true,
                label: 'CEP *',
                controller: state.guardianZipCodeController),
            MyTextField(
                isRequired: true,
                label: 'País *',
                controller: state.guardianCountryController),
            MyTextField(
              isRequired: true,
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

  final ValueChanged<Object?> onChanged;

  const PagadorRadio({super.key, required this.onChanged});
}

class _PagadorRadioState extends State<PagadorRadio> {
  Object? payer = 1;

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
                groupValue: payer,
                onChanged: (value) {
                  widget.onChanged(value);
                  setState(() {
                    payer = value;
                  });
                }),
            const Text('Sim'),
            Radio(
                activeColor: primaryColor,
                value: 0,
                groupValue: payer,
                onChanged: (value) {
                  widget.onChanged(value);
                  setState(() {
                    payer = value;
                  });
                }),
            const Text('Não'),
          ],
        ),
      ],
    );
  }
}
