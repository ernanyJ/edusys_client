import 'package:data_table_2/data_table_2.dart';
import 'package:edusys_client/core/formaters.dart';
import 'package:edusys_client/presentation/guardian/state/guardian_page_state.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:edusys_client/util/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GuardianPage extends StatefulWidget {
  const GuardianPage({super.key});

  @override
  State<GuardianPage> createState() => _GuardianPageState();
}

class _GuardianPageState extends State<GuardianPage> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<GuardianPageState>(context);
    return Padding(
      padding: const EdgeInsets.all(defaultMainPad),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () => state.loadGuardians(),
                  child: const Text('Recarregar lista')),
            ],
          ),
          Expanded(
            child: state.guardians.isEmpty ||
                    state.loadingState == LoadingState.LOADING
                ? Center(
                    child: CircularProgressIndicator(color: primaryColor),
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
                        label: Text(
                          'ID',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      DataColumn(
                        tooltip: 'Ordenar por nome',
                        label: Text(
                          'Nome',
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
                          'Sexo',
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Email',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Data de nascimento',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Celular',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                    rows: [
                      ...state.guardians.map(
                        (guardian) => DataRow(
                          cells: [
                            DataCell(Text(guardian.id.toString())),
                            DataCell(Text(guardian.name)),
                            DataCell(Text(guardian.cpf)),
                            DataCell(
                              Text(guardian.sex.value),
                            ),
                            DataCell(Text(guardian.email)),
                            DataCell(Text(formatDate(guardian.birthDate))),
                            DataCell(Text(guardian.phone)),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
