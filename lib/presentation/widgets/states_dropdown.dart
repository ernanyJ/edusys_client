import 'package:brasil_fields/brasil_fields.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class StatesDropdown extends StatelessWidget {
  const StatesDropdown({
    super.key,
    required this.onChanged,
  });
  final void Function(Object?) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.1,
      child: DropdownButtonFormField(
        hint: const Text('Estado'),
        decoration: InputDecoration(
          focusColor: primaryColor,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: dangerColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: neutralColor)),
        ),
        style: Theme.of(context).textTheme.bodyMedium,
        items: Estados.listaEstadosSigla.map(
          (String estado) {
    
            return DropdownMenuItem(
              value: estado,
              child: Text(estado),
            );
          },
        ).toList(),
        onChanged: (v) {
          onChanged(v);
        },
      ),
    );
  }
}
