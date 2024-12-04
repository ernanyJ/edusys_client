import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.label,
      required this.controller,
      this.inputFormatters});

  final String label;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultInnerPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: neutralColor),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: TextField(
              inputFormatters: inputFormatters,
              controller: controller,
              decoration: InputDecoration(
                focusColor: primaryColor,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: errorColor)),
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
}
