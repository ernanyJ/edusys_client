import 'package:edusys_client/enums/sex_enum.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

const double scale = 0.20;

class SexDropdown extends StatelessWidget {
  const SexDropdown({
    super.key,
    this.scaleFactor = scale,
    required this.onChanged,
  });

  final double scaleFactor;
  final ValueChanged<Sex?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * scaleFactor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sexo',
            style: TextStyle(color: neutralColor),
          ),
          DropdownButtonFormField<Sex>(
            validator: (value) {
              if (value == null) {
                return 'Selecione o sexo';
              }
              return null;
            },
            style: Theme.of(context).textTheme.bodyMedium,
            alignment: Alignment.center,
            decoration: InputDecoration(
              focusColor: primaryColor,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: dangerColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: neutralColor)),
            ),
            items: Sex.values.map((Sex sex) {
              return DropdownMenuItem<Sex>(
                value: sex,
                child: Text(
                    sex == Sex.MALE
                        ? 'Masculino'
                        : sex == Sex.FEMALE
                            ? 'Feminino'
                            : 'Outro',
                    style: Theme.of(context).textTheme.bodyMedium),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
