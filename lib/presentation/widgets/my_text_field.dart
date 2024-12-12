import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.label,
      required this.controller,
      this.inputFormatters,
      this.helpTip,
      this.enabled,
      this.actions});

  final String label;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? helpTip;
  final bool? enabled;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultInnerPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(color: neutralColor),
              ),
              const SizedBox(width: defaultInnerPad),
              if (actions != null) ...actions!, // todo: ajustar espaçamento
              SizedBox(child: helpTip ?? const SizedBox.shrink()),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (!isValidCPF(value)) {
                  // Show error message or handle invalid CPF
                }
              },
              enabled: enabled,
              inputFormatters: inputFormatters,
              controller: controller,
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
            ),
          ),
        ],
      ),
    );
  }

  // Implement CPF validation
  bool isValidCPF(String value) {
    // Remove any non-numeric characters
    value = value.replaceAll(RegExp(r'\D'), '');

    // CPF must be 11 digits long
    if (value.length != 11) return false;

    // Check for known invalid CPFs
    if (RegExp(r'^(\d)\1*$').hasMatch(value)) return false;

    // Validate first digit
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += int.parse(value[i]) * (10 - i);
    }
    int firstDigit = (sum * 10) % 11;
    if (firstDigit == 10) firstDigit = 0;
    if (firstDigit != int.parse(value[9])) return false;

    // Validate second digit
    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += int.parse(value[i]) * (11 - i);
    }
    int secondDigit = (sum * 10) % 11;
    if (secondDigit == 10) secondDigit = 0;
    if (secondDigit != int.parse(value[10])) return false;

    return true;
  }
}
