import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.label,
    required this.controller,
    this.inputFormatters,
    this.helpTip,
    this.enabled,
    this.actions,
    this.scaleFactor = 0.3,
    this.icon,
    this.suffixIcon,
    this.readOnly = false,
    this.suffix,
  });

  final String label;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? helpTip;
  final bool? enabled;
  final List<Widget>? actions;
  final double scaleFactor;
  final Widget? icon;
  final bool readOnly;
  final Widget? suffix;
  final Widget? suffixIcon;

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
            width: MediaQuery.of(context).size.width * scaleFactor,
            child: TextField(
              readOnly: readOnly,
              cursorColor: primaryColor,
              keyboardType: TextInputType.number,
              enabled: enabled,
              inputFormatters: inputFormatters,
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                suffix: suffix,
                prefixIcon: icon,
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
}
