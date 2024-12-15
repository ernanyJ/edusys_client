import 'package:data_table_2/data_table_2.dart';
import 'package:edusys_client/core/formaters.dart';
import 'package:edusys_client/presentation/contract/contract_page_state.dart';
import 'package:edusys_client/presentation/student/widgets/students_details_dialog.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:edusys_client/util/hover_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ContractPageState>(context);
    return Padding(
      padding: const EdgeInsets.all(defaultMainPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Contrato',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Spacer(),
              TextButton(
                  onPressed: () => context.go('/contract/add'),
                  child: Row(
                    children: [
                      Icon(Icons.add, color: primaryColor),
                      const SizedBox(width: 5),
                      const Text('Novo contrato'),
                    ],
                  )),
              TextButton(
                onPressed: () => {
                  state.getContracts(),
                },
                child: const Text('Recarregar lista'),
              ),
            ],
          ),
          Expanded(
            child: DataTable2(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              columns: [
                DataColumn(
                  label: Text(
                    'ID',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Data de início',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Data de término',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Dia do pagamento',
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Status',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Aluno',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Responsável',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
              rows: [
                ...state.contracts.map(
                  (contract) => DataRow(
                    cells: [
                      DataCell(Text(contract.id.toString())),
                      DataCell(Text(formatDate(contract.startDate))),
                      DataCell(Text(formatDate(contract.endDate))),
                      const DataCell(Text('15')),
                      DataCell(Text(
                        contract.status.value,
                        style: TextStyle(
                          color: contract.status.color,
                        ),
                      )),
                      DataCell(
                        onTap: () => {
                          showDialog(
                            context: context,
                            builder: (context) => StudentsDetailsDialog(
                                student: contract.student),
                          ),
                        },
                        HoverBuilder(
                          builder: (isHovering) => Builder(
                            builder: (context) => Text(
                              contract.student.name,
                              style: TextStyle(
                                color: isHovering
                                    ? Theme.of(context).primaryColor
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataCell(Text(contract.guardian.name)),
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
