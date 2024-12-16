import 'package:edusys_client/data/models/out/address_model_out.dart';
import 'package:edusys_client/data/models/out/student_model_out.dart';
import 'package:edusys_client/enums/sex_enum.dart';
import 'package:flutter/material.dart';

class CreateStudentDialogState extends ChangeNotifier {
  // PERSONAL INFO:
  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

// ACADEMIC INFO:
  TextEditingController enrollmentController = TextEditingController();

// ADDRESS INFO:
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController referenceController = TextEditingController();

  late Sex? sex;

  StudentModelOut? currentStudent;

  void createStudent() {
    currentStudent = StudentModelOut(
      name: nameController.text,
      cpf: cpfController.text,
      rg: rgController.text,
      birthDate: birthDateController.text,
      enrollmentId: enrollmentController.text,
      sex: sex!,
      guardianId: <int>{},
      address: AddressModelOut(
        street: streetController.text,
        number: numberController.text,
        neighborhood: neighborhoodController.text,
        city: cityController.text,
        state: stateController.text,
        zipCode: zipCodeController.text,
        complement: complementController.text,
        country: countryController.text,
        reference: referenceController.text,
      ),
      classGroupId: null,
    );
    notifyListeners();
  }

  void clear() {
    nameController.clear();
    cpfController.clear();
    rgController.clear();
    birthDateController.clear();
    enrollmentController.clear();
    streetController.clear();
    numberController.clear();
    neighborhoodController.clear();
    cityController.clear();
    stateController.clear();
    zipCodeController.clear();
    complementController.clear();
    countryController.clear();
    referenceController.clear();
    currentStudent = null;
    notifyListeners();
  }
}
