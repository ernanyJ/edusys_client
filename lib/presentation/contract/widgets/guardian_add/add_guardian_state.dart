import 'package:edusys_client/data/models/out/address_model_out.dart';
import 'package:edusys_client/data/models/out/guardian_model_out.dart';
import 'package:edusys_client/enums/sex_enum.dart';
import 'package:flutter/material.dart';

class AddGuardianState extends ChangeNotifier {
  List<GuardianModelOut> guardians = [];

  // PERSONAL INFO:
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController guardianCpfController = TextEditingController();
  TextEditingController guardianRgController = TextEditingController();
  TextEditingController guardianBirthDateController = TextEditingController();
  TextEditingController guardianEmailController = TextEditingController();
  TextEditingController guardianPhoneController = TextEditingController();
  TextEditingController guardianSecondaryPhoneController =
      TextEditingController();
  bool isPayer = true;
  Sex? currentSexSelected;

  // ADDRESS INFO:
  TextEditingController guardianStreetController = TextEditingController();
  TextEditingController guardianNumberController = TextEditingController();
  TextEditingController guardianComplementController = TextEditingController();
  TextEditingController guardianNeighborhoodController =
      TextEditingController();
  TextEditingController guardianCityController = TextEditingController();
  TextEditingController guardianStateController = TextEditingController();
  TextEditingController guardianZipCodeController = TextEditingController();
  TextEditingController guardianCountryController = TextEditingController();
  TextEditingController guardianReferenceController = TextEditingController();

  void addGuardian() {
    var guardian = GuardianModelOut(
        name: guardianNameController.text,
        cpf: guardianCpfController.text,
        sex: currentSexSelected ?? Sex.MALE,
        birthDate: guardianBirthDateController.text,
        payer: isPayer,
        address: AddressModelOut(
            street: guardianStreetController.text,
            number: guardianNumberController.text,
            complement: guardianComplementController.text,
            neighborhood: guardianNeighborhoodController.text,
            city: guardianCityController.text,
            state: guardianStateController.text,
            zipCode: guardianZipCodeController.text,
            country: guardianCountryController.text,
            reference: guardianReferenceController.text));

    guardians.add(guardian);
    clearControllers();
    notifyListeners();
  }

  void clearControllers() {
    guardianNameController.clear();
    guardianCpfController.clear();
    guardianRgController.clear();
    guardianBirthDateController.clear();
    guardianEmailController.clear();
    guardianPhoneController.clear();
    guardianSecondaryPhoneController.clear();
    guardianStreetController.clear();
    guardianNumberController.clear();
    guardianComplementController.clear();
    guardianNeighborhoodController.clear();
    guardianCityController.clear();
    guardianStateController.clear();
    guardianZipCodeController.clear();
    guardianCountryController.clear();
    guardianReferenceController.clear();
  }

  void setUpControllers(GuardianModelOut? guardian, int? index) {
    guardianNameController.text = guardian?.name ?? '';
    guardianCpfController.text = guardian?.cpf ?? '';
    guardianRgController.text = guardian?.rg ?? '';
    guardianBirthDateController.text = guardian?.birthDate ?? '';
    guardianEmailController.text = guardian?.email ?? '';
    guardianPhoneController.text = guardian?.phone ?? '';
    guardianSecondaryPhoneController.text = guardian?.secondPhone ?? '';
    isPayer = guardian?.payer ?? true;
    currentSexSelected = Sex.MALE;
    guardianStreetController.text = guardian?.address.street ?? '';
    guardianNumberController.text = guardian?.address.number ?? '';
    guardianComplementController.text = guardian?.address.complement ?? '';
    guardianNeighborhoodController.text = guardian?.address.neighborhood ?? '';
    guardianCityController.text = guardian?.address.city ?? '';
    guardianStateController.text = guardian?.address.state ?? '';
    guardianZipCodeController.text = guardian?.address.zipCode ?? '';
    guardianCountryController.text = guardian?.address.country ?? '';
    guardianReferenceController.text = guardian?.address.reference ?? '';
    notifyListeners();
  }

  void updateGuardian(int index) {
    var guardian = GuardianModelOut(
        name: guardianNameController.text,
        cpf: guardianCpfController.text,
        sex: currentSexSelected ?? Sex.MALE,
        birthDate: guardianBirthDateController.text,
        payer: isPayer,
        address: AddressModelOut(
            street: guardianStreetController.text,
            number: guardianNumberController.text,
            complement: guardianComplementController.text,
            neighborhood: guardianNeighborhoodController.text,
            city: guardianCityController.text,
            state: guardianStateController.text,
            zipCode: guardianZipCodeController.text,
            country: guardianCountryController.text,
            reference: guardianReferenceController.text));

    guardians.insert(index, guardian);
    clearControllers();
    notifyListeners();
  }
}
