import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatefulWidget {
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
    this.isRequired = false,
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
  final bool isRequired;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool showWarning = false;

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
                widget.label,
                style: TextStyle(color: neutralColor),
              ),
              const SizedBox(width: defaultInnerPad),
              if (widget.actions != null)
                ...widget.actions!, // todo: ajustar espaçamento
              SizedBox(child: widget.helpTip ?? const SizedBox.shrink()),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * widget.scaleFactor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onTapOutside: (event) {
                    if (widget.isRequired) {
                      if (widget.controller!.text.isEmpty) {
                        setState(() {
                          showWarning = true;
                        });
                      } else {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          showWarning = false;
                        });
                      }
                    }
                    FocusScope.of(context).unfocus();
                  },
                  readOnly: widget.readOnly,
                  cursorColor: primaryColor,
                  keyboardType: TextInputType.number,
                  enabled: widget.enabled,
                  inputFormatters: widget.inputFormatters,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    suffixIcon: widget.suffixIcon,
                    suffix: widget.suffix,
                    prefixIcon: widget.icon,
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
                Visibility(
                  visible: showWarning,
                  child: Text(
                    'Campo obrigatório!',
                    style: TextStyle(color: dangerColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
