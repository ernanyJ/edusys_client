import 'package:flutter/material.dart';

class AddGuardianState extends ChangeNotifier {

  // PERSONAL INFO:
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController guardianCpfController = TextEditingController();
  TextEditingController guardianRgController = TextEditingController();
  TextEditingController guardianBirthDateController = TextEditingController();
  TextEditingController guardianEmailController = TextEditingController();
  TextEditingController guardianPhoneController = TextEditingController();
  TextEditingController guardianSecondaryPhoneController = TextEditingController();
  bool isPayer = true;

  // ADDRESS INFO:
  TextEditingController guardianStreetController = TextEditingController();
  TextEditingController guardianNumberController = TextEditingController();
  TextEditingController guardianComplementController = TextEditingController();
  TextEditingController guardianNeighborhoodController = TextEditingController();
  TextEditingController guardianCityController = TextEditingController();
  TextEditingController guardianStateController = TextEditingController();
  TextEditingController guardianZipCodeController = TextEditingController();
  TextEditingController guardianCountryController = TextEditingController();
  TextEditingController guardianReferenceController = TextEditingController();

  

  
}