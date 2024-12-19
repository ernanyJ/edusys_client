import 'package:edusys_client/core/formaters.dart';
import 'package:edusys_client/data/models/out/address_model_out.dart';
import 'package:edusys_client/data/models/out/guardian_model_out.dart';
import 'package:edusys_client/enums/sex_enum.dart';
import 'package:edusys_client/exceptions/invalid_input.dart';
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
  TextEditingController guardianCityController = TextEditingController()
    ..text = 'Boa Vista';
  TextEditingController guardianStateController = TextEditingController()
    ..text = 'Roraima';
  TextEditingController guardianZipCodeController = TextEditingController();
  TextEditingController guardianCountryController = TextEditingController()
    ..text = 'Brasil';
  TextEditingController guardianReferenceController = TextEditingController();

  void addGuardian() {
    if (guardians.any((e) => e.payer) && isPayer) {
      throw InvalidInput('Já existe um pagador cadastrado');
    }

    var guardian = GuardianModelOut(
      name: guardianNameController.text,
      cpf: guardianCpfController.text,
      rg: guardianRgController.text,
      phone: guardianPhoneController.text,
      secondPhone: guardianSecondaryPhoneController.text,
      email: guardianEmailController.text,
      sex: currentSexSelected!,
      birthDate: parseDate(guardianBirthDateController.text),
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
          reference: guardianReferenceController.text),
    );

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
    guardianBirthDateController.text = formatDate(guardian?.birthDate);
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
    if ((index >= 0 && index < guardians.length)) {
      if (guardians.any((e) => e.payer) && isPayer && !guardians[index].payer) {
        throw InvalidInput('Já existe um pagador cadastrado');
      }
      guardians[index] = GuardianModelOut(
          name: guardianNameController.text,
          rg: guardianRgController.text,
          phone: guardianPhoneController.text,
          secondPhone: guardianSecondaryPhoneController.text,
          email: guardianEmailController.text,
          cpf: guardianCpfController.text,
          sex: currentSexSelected ?? Sex.MALE,
          birthDate: parseDate(guardianBirthDateController.text),
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
    }

    clearControllers();
    notifyListeners();
  }

  void validateControllers() {
    if (guardianNameController.text.isEmpty ||
        guardianCpfController.text.isEmpty ||
        guardianRgController.text.isEmpty ||
        guardianBirthDateController.text.isEmpty ||
        guardianEmailController.text.isEmpty ||
        guardianPhoneController.text.isEmpty ||
        guardianStreetController.text.isEmpty ||
        guardianNumberController.text.isEmpty ||
        guardianComplementController.text.isEmpty ||
        guardianNeighborhoodController.text.isEmpty ||
        guardianCityController.text.isEmpty ||
        guardianStateController.text.isEmpty ||
        guardianZipCodeController.text.isEmpty ||
        guardianCountryController.text.isEmpty) {
      throw InvalidInput(
          'Preencha os campos são obrigatórios. Campos faltantes: ${getMissingFields()}');
    }
  }

  String getMissingFields() {
    List<String> missingFields = [];

    if (guardianNameController.text.isEmpty) missingFields.add('Nome');
    if (guardianCpfController.text.isEmpty) missingFields.add('CPF');
    if (guardianRgController.text.isEmpty) missingFields.add('RG');
    if (guardianBirthDateController.text.isEmpty) {
      missingFields.add('Data de Nascimento');
    }
    if (guardianEmailController.text.isEmpty) missingFields.add('Email');
    if (guardianPhoneController.text.isEmpty) missingFields.add('Telefone');
    if (guardianStreetController.text.isEmpty) missingFields.add('Rua');
    if (guardianNumberController.text.isEmpty) missingFields.add('Número');
    if (guardianComplementController.text.isEmpty) {
      missingFields.add('Complemento');
    }
    if (guardianNeighborhoodController.text.isEmpty) {
      missingFields.add('Bairro');
    }
    if (guardianCityController.text.isEmpty) missingFields.add('Cidade');
    if (guardianStateController.text.isEmpty) missingFields.add('Estado');
    if (guardianZipCodeController.text.isEmpty) missingFields.add('CEP');
    if (guardianCountryController.text.isEmpty) missingFields.add('País');

    return missingFields.join(', ');
  }

  void removeGuardian(int index, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Exclusão'),
          content:
              const Text('Você realmente deseja excluir este responsável?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Excluir'),
              onPressed: () {
                Navigator.of(context).pop();
                if (index >= 0 && index < guardians.length) {
                  guardians.removeAt(index);
                  notifyListeners();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
