import 'package:edusys_client/core/formaters.dart';
import 'package:edusys_client/exceptions/invalid_input.dart';
import 'package:flutter/material.dart';

class AddContractPageState extends ChangeNotifier {
  TextEditingController beginDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  TextEditingController discountController = TextEditingController();

  TextEditingController monthlyValueController = TextEditingController();

  void validateData(BuildContext context) {
    DateTime? beginDate = parseDate(beginDateController.text);
    DateTime? endDate = parseDate(endDateController.text);

    if (beginDate.isAfter(endDate)) {
      throw InvalidInput('Data de início não pode ser após a data de término');
    }
  }

  // validate if begin date is note after end date
}
