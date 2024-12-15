import 'package:brasil_fields/brasil_fields.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

double scale = 0.20;

class CreateStudentDialog extends StatelessWidget {
  const CreateStudentDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                Text(
                  'Informações pessoais:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    Form(
                      child: MyTextField(
                          scaleFactor: scale,
                          label: 'Nome *',
                          controller: TextEditingController()),
                    ),
                    MyTextField(
                      scaleFactor: scale,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      label: 'CPF *',
                      controller: TextEditingController(),
                    ),
                    MyTextField(
                        scaleFactor: scale,
                        label: 'RG *',
                        controller: TextEditingController()),
                    MyTextField(
                        scaleFactor: scale,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          DataInputFormatter(),
                        ],
                        label: 'Data de nascimento *',
                        controller: TextEditingController()),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      
                      'Dados acadêmicos:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    MyTextField(
                        scaleFactor: scale,
                        label: 'Matrícula *',
                        controller: TextEditingController()),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Endereço:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    Wrap(
                      children: [
                        MyTextField(
                          label: 'Rua *',
                          controller: TextEditingController(),
                        ),
                        MyTextField(
                          label: 'Número *',
                          controller: TextEditingController(),
                        ),
                        MyTextField(
                          label: 'Complemento *',
                          controller: TextEditingController(),
                        ),
                        MyTextField(
                          label: 'Bairro *',
                          controller: TextEditingController(),
                        ),
                        MyTextField(
                            label: 'Cidade *',
                            controller: TextEditingController()),
                        MyTextField(
                            label: 'Estado *',
                            controller: TextEditingController()),
                        MyTextField(
                            label: 'CEP *',
                            controller: TextEditingController()),
                        MyTextField(
                            label: 'País *',
                            controller: TextEditingController()),
                        MyTextField(
                          label: 'Referência',
                          controller: TextEditingController(),
                        ),
                      ],
                    ),
                  ],
                ),
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
            Navigator.of(context).pop();
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}
