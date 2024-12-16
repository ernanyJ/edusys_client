import 'package:brasil_fields/brasil_fields.dart';
import 'package:edusys_client/enums/sex_enum.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/presentation/widgets/sex_dropdown.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double scale = 0.20;

class AddGuardianDialog extends StatelessWidget {
  const AddGuardianDialog({super.key});

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
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
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
                controller: TextEditingController()),
            MyTextField(
              scaleFactor: scale,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
              label: 'CPF *',
              controller: TextEditingController(),
              isRequired: true,
            ),
            Column(
              children: [
                const SizedBox(height: 9),
                SexDropdown(
                  onChanged: (Sex? value) {},
                ),
              ],
            ),
            MyTextField(
              isRequired: true,
              scaleFactor: scale,
              label: 'RG',
              controller: TextEditingController(),
            ),
            MyTextField(
                isRequired: true,
                scaleFactor: scale,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter(),
                ],
                label: 'Data de nascimento *',
                controller: TextEditingController()),
            MyTextField(
                isRequired: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')),
                ],
                scaleFactor: scale,
                label: 'Email *',
                controller: TextEditingController()),
            MyTextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                scaleFactor: scale,
                isRequired: true,
                label: 'Celular *',
                controller: TextEditingController()),
            MyTextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                scaleFactor: scale,
                label: 'Celular secundário',
                controller: TextEditingController()),
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
              controller: TextEditingController(),
            ),
            MyTextField(
              isRequired: true,
              label: 'Número *',
              controller: TextEditingController(),
            ),
            MyTextField(
              isRequired: true,
              label: 'Complemento *',
              controller: TextEditingController(),
            ),
            MyTextField(
              isRequired: true,
              label: 'Bairro *',
              controller: TextEditingController(),
            ),
            MyTextField(
                isRequired: true,
                label: 'Cidade *',
                controller: TextEditingController()),
            MyTextField(
                isRequired: true,
                label: 'Estado *',
                controller: TextEditingController()),
            MyTextField(
                isRequired: true,
                label: 'CEP *',
                controller: TextEditingController()),
            MyTextField(
                isRequired: true,
                label: 'País *',
                controller: TextEditingController()),
            MyTextField(
              isRequired: true,
              label: 'Referência',
              controller: TextEditingController(),
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
