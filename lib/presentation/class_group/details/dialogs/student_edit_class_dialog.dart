import 'package:brasil_fields/brasil_fields.dart';
import 'package:edusys_client/core/formaters.dart';
import 'package:edusys_client/data/models/out/address_model_out.dart';
import 'package:edusys_client/data/models/out/student_model_out.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/enums/sex_enum.dart';
import 'package:edusys_client/presentation/class_group/details/class_group_details_state.dart';
import 'package:edusys_client/presentation/class_group/details/dialogs/widgets/class_movement_dialog.dart';
import 'package:edusys_client/presentation/student/state/fee_visualizer_state.dart';
import 'package:edusys_client/presentation/student/state/student_page_state.dart';
import 'package:edusys_client/presentation/student/state/student_text_controller.dart';
import 'package:edusys_client/presentation/student/widgets/fee_visualizer.dart';
import 'package:edusys_client/presentation/student/widgets/students_details_dialog.dart';
import 'package:edusys_client/presentation/student/widgets/tuition_status_badge.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class StudentEditClassDialog extends StatefulWidget {
  const StudentEditClassDialog({
    super.key,
    required this.student,
  });

  final StudentEntity student;

  @override
  State<StudentEditClassDialog> createState() => _ClassGroupDetailsState();
}

class _ClassGroupDetailsState extends State<StudentEditClassDialog> {
  bool _isAddressEditing = false;

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<StudentPageState>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              StudentTextController(widget.student),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              FeeVisualizerState(widget.student)..init(),
        ),
      ],
      child: Builder(builder: (context) {
        final textController = Provider.of<StudentTextController>(context);

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
              TuitionStatusBadge(
                  tuitionFeeStatus: widget.student.currentMonthPaid),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Form(
                          child: MyTextField(
                              label: 'Nome',
                              controller: textController.nameController
                                ..text = widget.student.name),
                        ),
                        const SizedBox(
                          width: defaultInnerPad,
                        ),
                        MyTextField(
                          label: 'Matricula',
                          controller: textController.enrollmentController
                            ..text = widget.student.enrollment ?? '',
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
                          controller: textController.cpfController
                            ..text = widget.student.cpf,
                        ),
                        MyTextField(
                          label: 'RG',
                          controller: textController.rgController
                            ..text = widget.student.rg,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyTextField(
                          enabled: false,
                          actions: [
                            TextButton(
                              onPressed: () => openAddressOptions(),
                              child: const Text('Editar'),
                            ),
                          ],
                          label: 'Endereço',
                          controller: TextEditingController(
                              text: formatAddress(widget.student.address)),
                        ),
                        MyTextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            DataInputFormatter(),
                          ],
                          label: 'Data de nascimento',
                          controller: textController.birthController
                            ..text = formatDate(widget.student.birthDate),
                        ),
                      ],
                    ),
                    if (_isAddressEditing)
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyTextField(
                                label: 'Rua',
                                controller: textController.streetController
                                  ..text = widget.student.address.street,
                              ),
                              MyTextField(
                                label: 'Número',
                                controller: textController.numberController
                                  ..text = widget.student.address.number,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyTextField(
                                label: 'Complemento',
                                controller: textController.complementController
                                  ..text = widget.student.address.complement,
                              ),
                              MyTextField(
                                label: 'Bairro',
                                controller: textController
                                    .neighborhoodController
                                  ..text = widget.student.address.neighborhood,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyTextField(
                                label: 'Cidade',
                                controller: textController.cityController
                                  ..text = widget.student.address.city,
                              ),
                              MyTextField(
                                label: 'Estado',
                                controller: textController.stateController
                                  ..text = widget.student.address.state,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyTextField(
                                label: 'CEP',
                                controller: textController.zipCodeController
                                  ..text = widget.student.address.zipCode,
                              ),
                              MyTextField(
                                label: 'País',
                                controller: textController.countryController
                                  ..text = widget.student.address.country,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              MyTextField(
                                label: 'Referência',
                                controller: textController.referenceController
                                  ..text = widget.student.address.reference,
                              ),
                            ],
                          ),
                        ],
                      ),
                    const SizedBox(height: defaultMainPad),
                    Row(
                      children: [
                        const Spacer(),
                        ChangeClassGroupButton(
                          student: widget.student,
                          onPressed: () {},
                        ),
                        const SizedBox(width: defaultMainPad),
                        EditButton(() {
                          var cacheStudent =   StudentModelOut(
                                name: textController.nameController.text,
                                birthDate: formatDateForApi(
                                    textController.birthController.text),
                                cpf: textController.cpfController.text,
                                rg: textController.rgController.text,
                                sex: Sex.MALE,
                                enrollmentId:
                                    textController.enrollmentController.text,
                                guardianId: {1},
                                classGroupId: 1,
                                address: AddressModelOut(
                                  street: textController.streetController.text,
                                  city: textController.cityController.text,
                                  state: textController.stateController.text,
                                  zipCode:
                                      textController.zipCodeController.text,
                                  country:
                                      textController.countryController.text,
                                  number: textController.numberController.text,
                                  complement:
                                      textController.complementController.text,
                                  neighborhood: textController
                                      .neighborhoodController.text,
                                  reference:
                                      textController.referenceController.text,
                                ),
                              );
                          state.updateStudent(
                              widget.student.id,
                            cacheStudent,
                              context);
                              context.read<ClassGroupDetailsState>().replaceStudent(widget.student.id, cacheStudent);
                          Navigator.of(context).pop();
                        }),
                      ],
                    ),
                    const SizedBox(height: defaultMainPad),
                    const SizedBox(height: defaultMainPad),
                    FeeVisualizer(student: widget.student),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  String formatDateForApi(String text) {
    final parts = text.split('/');
    if (parts.length == 3) {
      return '${parts[2]}-${parts[1]}-${parts[0]}';
    }
    return text;
  }

  void openAddressOptions() {
    setState(() {
      _isAddressEditing = !_isAddressEditing;
    });
  }
}

class ChangeClassGroupButton extends StatelessWidget {
  const ChangeClassGroupButton(
      {super.key, required this.onPressed, required this.student});

  final void Function() onPressed;
  final StudentEntity student;

  @override
  Widget build(BuildContext context) {
            var state = Provider.of<ClassGroupDetailsState>(context)..getClassGroups();

    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return ClassMovementDialog(onPressed: onPressed, student: student);
          },
        ).then((v) => state.clearMoveStudentDialogData());
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(dangerColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text('Mover de turma',
            style: Theme.of(context).textTheme.labelSmall),
      ),
    );
  }
}
