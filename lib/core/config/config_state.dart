import 'package:flutter/material.dart';

class ConfigState extends ChangeNotifier {
  static TextEditingController schoolNameController = TextEditingController();
  static TextEditingController addressController = TextEditingController();
  static TextEditingController apiAddressController =
      TextEditingController(text: 'http://192.168.1.7:8080');
}
