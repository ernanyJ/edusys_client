import 'package:edusys_client/presentation/widgets/my_search_field.dart';
import 'package:flutter/material.dart';

class StudentActionsRow extends StatelessWidget {
  const StudentActionsRow({
    super.key,
    required this.onChanged,
    required this.reloadButtonAction,
  });

  final dynamic Function(String) onChanged;
  final void Function() reloadButtonAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 600,
          child: MySearchField(
            hint: 'Pesquisar por nome, CPF, matrícula, RG...',
            onChanged: (query) => onChanged(query),
          ),
        ),
        TextButton(
          onPressed: () =>
              reloadButtonAction.call(), //
          child: const Text('Recarregar lista'),
        ),
      ],
    );
  }
}
