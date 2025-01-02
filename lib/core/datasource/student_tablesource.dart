import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:edusys_client/presentation/student/state/student_page_state.dart';
import 'package:flutter/material.dart';

class StudentTablesource extends AdvancedDataTableSource {
  String lastSearchTerm = 'luca';
  final StudentPageState provider;

  StudentTablesource({
    required this.provider,
  });

  @override
  Future<RemoteDataSourceDetails> getNextPage(
      NextPageRequest pageRequest) async {
    if (lastSearchTerm.isNotEmpty) {
      final page = await provider.searchStudentsByQuery(
        lastSearchTerm,
        pageRequest.offset,
        pageRequest.pageSize,
      );

      final totalRows = page.totalElements;
      final rows = page.content
          .map(
            (e) => DataRow(
              cells: [
                DataCell(Text('${e.id}')),
                DataCell(Text(e.name)),
                DataCell(Text(e.classGroup?.name ?? 'N/A')),
                // DataCell(Text(e.cpf)),
                // DataCell(Text(
                //     e.guardians.isNotEmpty ? e.guardians.first.name : 'N/A')),
                // DataCell(Text(e.enrollment ?? 'N/A')),
              ],
            ),
          )
          .toList();

      return RemoteDataSourceDetails(totalRows, rows);
    }

    var page = await provider.loadPaginatedStudents(
      size: pageRequest.pageSize,
      page: pageRequest.offset,
    );

    final totalRows = page.totalElements;
    final rows = page.content
        .map(
          (e) => DataRow(
            cells: [
              DataCell(Text('${e.id}')),
              DataCell(Text(e.name)),
              DataCell(Text(e.classGroup?.name ?? 'N/A')),
              // DataCell(Text(e.cpf)),
              // DataCell(Text(
              //     e.guardians.isNotEmpty ? e.guardians.first.name : 'N/A')),
              // DataCell(Text(e.enrollment ?? 'N/A')),
            ],
          ),
        )
        .toList();

    return RemoteDataSourceDetails(totalRows, rows);
  }

  void updateSearchTerm(String searchTerm) {
    lastSearchTerm = searchTerm;
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    return lastDetails!.rows[index];
  }

  @override
  int get selectedRowCount => 0;
}

// class StudentTablesource extends AsyncDataTableSource {
//   final StudentPageState provider;
//   int totalRows = 0;
//   bool isLoading = false;
//   String? searchQuery; // Armazena a consulta de busca atual

//   StudentTablesource({
//     required this.provider,
//   });

//   /// Atualiza a consulta de busca e notifica o DataTable
//   void updateSearchQuery(String query) {
//     searchQuery = query.isNotEmpty ? query : null;
//     notifyListeners();
//   }

//   @override
//   Future<AsyncRowsResponse> getRows(int startIndex, int count) async {
//     final pageIndex = count > 0 ? startIndex ~/ count : 0;
//     isLoading = true;

//     try {
//       final page = searchQuery == null || searchQuery!.isEmpty
//           ? await provider.loadPaginatedStudents(size: count, page: pageIndex)
//           : await provider.searchStudentsByQuery(
//               searchQuery!, pageIndex, count);

//       totalRows = page.totalElements;

//       final rows = page.content
//           .map(
//             (e) => DataRow(
//               cells: [
//                 DataCell(Text('${e.id}')),
//                 DataCell(Text(e.name)),
//                 DataCell(Text(e.classGroup?.name ?? 'N/A')),
//                 DataCell(getTuitionText(e.currentMonthPaid)),
//                 DataCell(Text(e.cpf)),
//                 DataCell(Text(
//                     e.guardians.isNotEmpty ? e.guardians.first.name : 'N/A')),
//                 DataCell(Text(e.enrollment ?? 'N/A')),
//               ],
//             ),
//           )
//           .toList();

//       return AsyncRowsResponse(totalRows, rows);
//     } catch (e) {
//       // Log ou tratamento de erro
//       return AsyncRowsResponse(totalRows, []);
//     } finally {
//       isLoading = false;
//     }
//   }

//   @override
//   bool get isRowCountApproximate => false;
//   @override
//   int get rowCount => totalRows;
//   @override
//   int get selectedRowCount => 0;

//   static Text getTuitionText([TuitionFeeStatus? status]) {
//     const defaultStyle =
//         TextStyle(color: Colors.black, fontWeight: FontWeight.w600);

//     const statusStyles = {
//       TuitionFeeStatus.PAID:
//           TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
//       TuitionFeeStatus.PENDING:
//           TextStyle(color: Colors.yellow, fontWeight: FontWeight.w600),
//       TuitionFeeStatus.LATE:
//           TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
//     };

//     return Text(
//       status == null ? 'N/A' : status.name,
//       style: statusStyles[status] ?? defaultStyle,
//     );
//   }
// }
