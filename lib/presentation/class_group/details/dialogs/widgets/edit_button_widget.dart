import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton(
    this.onPressed, {
    super.key,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
      ),
      child: Text(
        'Salvar alterações',
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
