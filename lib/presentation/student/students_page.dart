import 'package:edusys_client/core/datasource/student_tablesource.dart';
import 'package:edusys_client/presentation/student/state/student_page_state.dart';
import 'package:edusys_client/presentation/student/widgets/student_actions_row.dart';
import 'package:edusys_client/presentation/student/widgets/student_count_cards_row.dart';
import 'package:edusys_client/presentation/student/widgets/student_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  late StudentTablesource source;

  @override
  void initState() {
    super.initState();
    final provider = context.read<StudentPageState>();
    source = StudentTablesource(provider: provider);
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<StudentPageState>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            StudentCountCardsRow(
              studentCount: state.studentCount,
              studentDebtCount: state.studentDebtCount,
            ),
            const SizedBox(height: 8),
            StudentActionsRow(
              onChanged: (query) => source.updateSearchTerm(query),
              reloadButtonAction: state.reloadStudents,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: StudentTable(source: source),
            ),
          ],
        ),
      ),
    );
  }
}
