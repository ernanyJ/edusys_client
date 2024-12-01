import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: DataTable2(
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
        rows: const [
          DataRow(
            cells: [
              DataCell(Text('João')),
              DataCell(Text('12')),
              DataCell(Text('R\$ 100,00')),
              DataCell(Text('123.456.789-00')),
              DataCell(Text('Maria')),
              DataCell(Text('123456')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('Maria')),
              DataCell(Text('10')),
              DataCell(Text('R\$ 80,00')),
              DataCell(Text('987.654.321-00')),
              DataCell(Text('João')),
              DataCell(Text('654321')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('José')),
              DataCell(Text('11')),
              DataCell(Text('R\$ 90,00')),
              DataCell(Text('456.789.123-00')),
              DataCell(Text('Maria')),
              DataCell(Text('789123')),
            ],
          ),
        ],
      ),
    ));
  }
}
