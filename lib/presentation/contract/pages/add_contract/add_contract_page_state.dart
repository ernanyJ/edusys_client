import 'package:edusys_client/core/formaters.dart';
import 'package:edusys_client/data/models/out/contract_model_out.dart';
import 'package:edusys_client/data/models/out/guardian_model_out.dart';
import 'package:edusys_client/data/models/out/student_contract_model_out.dart';
import 'package:edusys_client/data/models/out/student_model_out.dart';
import 'package:edusys_client/data/repositories/contract_repository_impl.dart';
import 'package:edusys_client/exceptions/invalid_input.dart';
import 'package:flutter/material.dart';

class AddContractPageState extends ChangeNotifier {
  TextEditingController beginDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  TextEditingController discountController = TextEditingController();

  TextEditingController monthlyValueController = TextEditingController();

  TextEditingController dueDayController = TextEditingController();

  void validateData(BuildContext context) {
    DateTime? beginDate = parseDate(beginDateController.text);
    DateTime? endDate = parseDate(endDateController.text);

    if (beginDate.isAfter(endDate)) {
      throw InvalidInput('Data de início não pode ser após a data de término');
    }
  }

  void addContract(Set<GuardianModelOut> guardians, StudentModelOut? student) {
    ContractRepositoryImpl repository = ContractRepositoryImpl();
    if (student == null) {
      throw InvalidInput('Aluno não inserido');
    }

    // create contract
    ContractModelOut contract = ContractModelOut(
      guardians: guardians,
      student: StudentContractModelOut(
          name: student.name,
          birthDate: parseDate(student.birthDate),
          cpf: student.cpf,
          rg: student.rg,
          sex: student.sex,
          address: student.address),
      startDate: parseDate(beginDateController.text),
      endDate: parseDate(endDateController.text),
      discountPercentage: double.parse(discountController.text),
      feeValue: double.parse(monthlyValueController.text.replaceAll(',', '.')),
      dueDay: int.parse(dueDayController.text),
    );

    // save contractw
    repository.addContract(contract);
  }
}
