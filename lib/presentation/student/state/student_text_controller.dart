import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:flutter/material.dart';

class StudentTextController extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController enrollmentController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController referenceController = TextEditingController();

  StudentTextController(StudentEntity student) {
    streetController.text = student.address.street;
    numberController.text = student.address.number;
    complementController.text = student.address.complement;
    neighborhoodController.text = student.address.neighborhood;
    cityController.text = student.address.city;
    stateController.text = student.address.state;
    zipCodeController.text = student.address.zipCode;
    countryController.text = student.address.country;
    referenceController.text = student.address.reference;
  }
}
