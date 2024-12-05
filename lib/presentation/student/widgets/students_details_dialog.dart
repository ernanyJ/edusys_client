import 'package:brasil_fields/brasil_fields.dart';
import 'package:edusys_client/core/formaters.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/presentation/student/widgets/fee_visualizer.dart';
import 'package:edusys_client/presentation/student/widgets/tuition_status_badge.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentsDetailsDialog extends StatelessWidget {
  const StudentsDetailsDialog({
    super.key,
    required this.student,
  });

  final StudentEntity student;

  @override
  Widget build(BuildContext context) {
    //var state = Provider.of<StudentPageState>(context);
    return AlertDialog(
      icon: Row(
        children: [
          Text(
            'Detalhes do estudante',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(
            width: defaultInnerPad + 12,
          ),
          const Spacer(),
          TuitionStatusBadge(tuitionFeeStatus: student.currentMonthPaid),
        ],
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.6,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: defaultMainPad, right: defaultMainPad),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      child: MyTextField(
                        label: 'Nome',
                        controller: TextEditingController(text: student.name),
                      ),
                    ),
                    const SizedBox(
                      width: defaultInnerPad,
                    ),
                    MyTextField(
                      label: 'Matricula',
                      controller:
                          TextEditingController(text: student.enrollment),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      label: 'CPF',
                      controller: TextEditingController(text: student.cpf),
                    ),
                    MyTextField(
                      label: 'RG',
                      controller: TextEditingController(text: student.rg),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                      label: 'Endereço',
                      controller: TextEditingController(
                          text: formatAddress(student.address)),
                    ),
                    MyTextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        DataInputFormatter(),
                      ],
                      label: 'Data de nascimento',
                      controller: TextEditingController(
                          text: formatDate(student.birthDate)),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                FeeVisualizer(student: student),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).pop(),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
      ),
      child: Text(
        'Salvar alterações',
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
