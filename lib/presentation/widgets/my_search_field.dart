import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class MySearchField extends StatelessWidget {
  const MySearchField({
    super.key,
    required this.onChanged,
    this.hint,
  });

  final Function(String) onChanged;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        onChanged(value);
      },
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: hint ?? 'Pesquisar...',
        focusColor: primaryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: primaryColor),
        ),
        prefixIcon: const Icon(Icons.search),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
