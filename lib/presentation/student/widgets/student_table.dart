import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:flutter/material.dart';

class StudentTable extends StatelessWidget {
  const StudentTable({super.key, required this.source});

  final AdvancedDataTableSource source;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AdvancedPaginatedDataTable(
        availableRowsPerPage: const [5, 10],
        onRowsPerPageChanged: (rowsPerPage) {},
        header: const Text('Estudantes'),
        source: source,
        columns: [
          DataColumn(
            label: Text(
              'ID',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          DataColumn(
            label: Text(
              'Nome',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          DataColumn(
            label: Text(
              'Turma',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          // DataColumn(
          //   label: Text(
          //     'Mensalidade\natual (${DateTime.now().month}/${(DateTime.now().year) - 2000})',
          //     softWrap: true,
          //     style: Theme.of(context).textTheme.bodyMedium,
          //     textAlign: TextAlign.justify,
          //   ),
          // ),
          // DataColumn(
          //   label: Text(
          //     'CPF',
          //     style: Theme.of(context).textTheme.bodyMedium,
          //   ),
          // ),
          // DataColumn(
          //   label: Text(
          //     'Responsável',
          //     style: Theme.of(context).textTheme.bodyMedium,
          //   ),
          // ),
          // DataColumn(
          //   label: Text(
          //     'Matrícula',
          //     style: Theme.of(context).textTheme.bodyMedium,
          //   ),
          // ),
        ],
      ),
    );
  }
}
