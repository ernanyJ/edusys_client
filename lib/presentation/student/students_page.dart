import 'package:data_table_2/data_table_2.dart';
import 'package:edusys_client/presentation/student/state/student_page_state.dart';
import 'package:edusys_client/presentation/student/widgets/count_card.dart';
import 'package:edusys_client/presentation/student/widgets/students_details_dialog.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:edusys_client/util/hover_builder.dart';
import 'package:edusys_client/util/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  var _isAscName = true;
  var _isAscClassGroup = true;
  var _isAscCurrentMonthPaid = true;
  var _isAscCpf = true;
  var _isAscGuardian = true;
  var _isAscEnrollment = true;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<StudentPageState>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: state.students.isEmpty
            ? Center(
                child: CircularProgressIndicator(color: primaryColor),
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: defaultInnerPad,
                    children: [
                      CountCard(
                          color: Colors.blue,
                          label: 'Total de estudantes',
                          info: state.studentCount.toString()),
                      CountCard(
                          color: dangerColor,
                          label: 'Mensalidades atrasadas',
                          info: state.studentDebtCount.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => state.reloadStudents(context),
                        child: const Text('Recarregar lista'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: state.loadingState == LoadingState.LOADING
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : DataTable2(
                            dataRowHeight: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            columns: [
                              DataColumn(
                                tooltip: 'Ordenar por ID',
                                onSort: (columnIndex, ascending) {
                                  state.orderBy(_isAscName, columnIndex);
                                  _isAscName = !_isAscName;
                                },
                                label: Text(
                                  'ID',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              DataColumn(
                                tooltip: 'Ordenar por nome',
                                onSort: (columnIndex, ascending) {
                                  state.orderBy(_isAscName, columnIndex);
                                  _isAscName = !_isAscName;
                                },
                                label: Text(
                                  'Nome',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              DataColumn(
                                tooltip: 'Ordenar por turma',
                                onSort: (columnIndex, ascending) {
                                  state.orderBy(_isAscClassGroup, columnIndex);
                                  _isAscClassGroup = !_isAscClassGroup;
                                },
                                label: Text(
                                  'Turma',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              DataColumn(
                                tooltip: 'Ordenar por mensalidaed',
                                onSort: (columnIndex, ascending) {
                                  state.orderBy(
                                      _isAscCurrentMonthPaid, columnIndex);
                                  _isAscCurrentMonthPaid =
                                      !_isAscCurrentMonthPaid;
                                },
                                label: Text(
                                  'Mensalidade\natual (${DateTime.now().month}/${(DateTime.now().year) - 2000})',
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              DataColumn(
                                tooltip: 'Ordenar por CPF',
                                onSort: (columnIndex, ascending) {
                                  state.orderBy(_isAscCpf, columnIndex);
                                  _isAscCpf = !_isAscCpf;
                                },
                                label: Text(
                                  'CPF',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              DataColumn(
                                tooltip: 'Ordenar por responsável',
                                onSort: (columnIndex, ascending) {
                                  state.orderBy(_isAscGuardian, columnIndex);
                                  _isAscGuardian = !_isAscGuardian;
                                },
                                label: Text(
                                  'Responsável',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              DataColumn(
                                tooltip: 'Ordenar por matrícula',
                                onSort: (columnIndex, ascending) {
                                  state.orderBy(_isAscEnrollment, columnIndex);
                                  _isAscEnrollment = !_isAscEnrollment;
                                },
                                label: Text(
                                  'Matrícula',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                            rows: [
                              ...state.students.map((student) {
                                return DataRow(
                                  cells: [
                                    DataCell(Text(student.id.toString())),
                                    DataCell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              StudentsDetailsDialog(
                                                  student: student),
                                        );
                                      },
                                      HoverBuilder(
                                        builder: (bool isHovered) {
                                          return Text(
                                            student.name,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: isHovered
                                                  ? Colors.blue
                                                  : Colors.black,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    DataCell(Text(student.classGroup?.room ?? 'Não atribuído')),
                                    DataCell(Text(
                                      student.currentMonthPaid?.value ??
                                          'Não possui',
                                      style: TextStyle(
                                          color:
                                              student.currentMonthPaid?.value ==
                                                      'Pendente'
                                                  ? const Color.fromARGB(
                                                      255, 202, 129, 1)
                                                  : student.currentMonthPaid
                                                              ?.value ==
                                                          'Atrasada'
                                                      ? Colors.red
                                                      : student.currentMonthPaid
                                                                  ?.value ==
                                                              'Paga'
                                                          ? Colors.green[700]
                                                          : null),
                                    )),
                                    DataCell(Text(student.cpf)),
                                    DataCell(
                                      HoverBuilder(
                                        builder: (bool isHovered) {
                                          return Text(
                                            student.guardians.first.name,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: isHovered
                                                  ? Colors.blue
                                                  : Colors.black,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    DataCell(Text(student.enrollment ?? '')),
                                  ],
                                );
                              }),
                            ],
                          ),
                  ),
                ],
              ),
      ),
    );
  }
}
