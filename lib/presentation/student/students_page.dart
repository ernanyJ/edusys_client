import 'package:data_table_2/data_table_2.dart';
import 'package:edusys_client/presentation/student/state/student_page_state.dart';
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
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<StudentPageState>(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: state.students.isEmpty
          ? const Center(
              child: Text('Parece que não tem nada aqui...'),
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => state.loadStudents(),
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
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.4),
                          ),
                          columns: [
                            DataColumn(
                              label: Text(
                                'Nome',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Idade',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Mensalidade atual',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'CPF',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Responsável',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            DataColumn(
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
                                  DataCell(
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
                                  DataCell(Text(
                                      state.calculateAge(student.birthDate))),
                                  DataCell(Text(student.sex.value)),
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
                                  DataCell(Text(student.enrollment)),
                                ],
                              );
                            }),
                          ],
                        ),
                ),
              ],
            ),
    ));
  }
}
