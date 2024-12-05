import 'package:flutter/material.dart';

class ConfigEntity {

   String schoolName = 'Escola Girassol';
  String schoolAddress = 'Rua das Flores, 123';
  String apiAddress = 'http://192.168.1.7:8080';

  late TextEditingController schoolNameController;
  late TextEditingController schoolAddressController;
  late TextEditingController apiAddressController;

  ConfigEntity() {
    schoolNameController = TextEditingController(text: schoolName);
    schoolAddressController = TextEditingController(text: schoolAddress);
    apiAddressController = TextEditingController(text: apiAddress);
  }
  
}

class ConfigSingleton{
 static ConfigEntity? _instance;

  static ConfigEntity getInstance() {
    _instance ??= ConfigEntity();

    return _instance!;
  }
}