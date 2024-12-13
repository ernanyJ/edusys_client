import 'package:brasil_fields/brasil_fields.dart';

import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

double scale = 0.20;

class AddStudentPage extends StatelessWidget {
  const AddStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultMainPad),
            child: Column(
              spacing: defaultInnerPad,
              children: [
                Row(
                  children: [
                    Text(
                      'Adicionar estudante',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: defaultMainPad, right: defaultMainPad),
                  child: Column(
                    spacing: defaultInnerPad,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Informações pessoais:',
                        style: TextStyle(
                          
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                      Wrap(
                        spacing: defaultMainPad,
                        children: [
                          MyTextField(
                            icon: const Icon(Icons.person),
                            scaleFactor: scale,
                            label: 'Nome',
                            controller: TextEditingController(),
                          ),
                          MyTextField(
                            icon: const Icon(Icons.date_range),
                            scaleFactor: scale,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              DataInputFormatter(),
                            ],
                            label: 'Data de nascimento',
                            controller: TextEditingController(),
                          ),
                          MyTextField(
                            icon: const Icon(Icons.contact_mail_sharp),
                            scaleFactor: scale,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CpfInputFormatter(),
                            ],
                            label: 'CPF',
                            controller: TextEditingController(),
                          ),
                          MyTextField(
                            icon: const Icon(Icons.assignment_ind),
                            scaleFactor: scale,
                            label: 'RG',
                            controller: TextEditingController(),
                          ),
                        ],
                      ), //FeeVisualizer(student: ),
                      Text(
                        'Dados acadêmicos:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                      Wrap(
                        children: [
                          MyTextField(
                            icon: const Icon(Icons.school),
                            scaleFactor: scale,
                            label: 'Matricula',
                            controller: TextEditingController(),
                          ),
                        ],
                      ),

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
                            icon: const Icon(Icons.location_on),
                            scaleFactor: scale,
                            label: 'Rua',
                            controller: TextEditingController(),
                          ),
                          MyTextField(
                            icon: const Icon(Icons.onetwothree_rounded, size: 35,),
                            scaleFactor: scale,
                            label: 'Número',
                            controller: TextEditingController(),
                          ),
                          MyTextField(
                            icon: const Icon(Icons.image_aspect_ratio_outlined),
                            scaleFactor: scale,
                            label: 'Complemento',
                            controller: TextEditingController(),
                          ),
                          MyTextField(
                            icon: const Icon(Icons.location_city),
                            scaleFactor: scale,
                            label: 'Bairro',
                            controller: TextEditingController(),
                          ),
                          MyTextField(
                            icon: const Icon(Icons.location_city),
                            scaleFactor: scale,
                            label: 'Cidade',
                            controller: TextEditingController(),
                          ),
                          MyTextField(
                            icon: const Icon(Icons.location_city),
                            scaleFactor: scale,
                            label: 'Estado',
                            controller: TextEditingController(),
                          ),
                          MyTextField(
                            icon: const Icon(Icons.edit_location_alt_outlined),
                            scaleFactor: scale,
                            label: 'CEP',
                            controller: TextEditingController(),
                          ),
                          MyTextField(
                            icon: const Icon(Icons.flag),
                            scaleFactor: scale,
                            label: 'País',
                            controller: TextEditingController(),
                          ),
                          MyTextField(
                            icon: const Icon(Icons.map),
                            label: 'Referência',
                            controller: TextEditingController(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
