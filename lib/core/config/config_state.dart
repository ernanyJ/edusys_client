import 'package:flutter/material.dart';

class ConfigState extends ChangeNotifier {
  static TextEditingController schoolNameController = TextEditingController();
  static TextEditingController addressController = TextEditingController();
  static TextEditingController apiAddressController =
      TextEditingController(text: 'http://192.168.100.59:8080');
}
