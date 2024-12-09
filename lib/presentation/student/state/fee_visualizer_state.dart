import 'package:edusys_client/data/repositories/tuition_fees_repository_impl.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/domain/entities/tuition_fee_entity.dart';
import 'package:flutter/material.dart';

class FeeVisualizerState extends ChangeNotifier {
  FeeVisualizerState(this.student);

  final StudentEntity student;

  void init() {
    getTuitionFeesFromStudent(student.id);
  }

  TuitionFeesRepositoryImpl repository = TuitionFeesRepositoryImpl();

  List<TuitionFeeEntity> tuitionFees = [];

  void getTuitionFeesFromStudent(int id) async {
    await repository.getTuitionFeesFromStudent(id).then((value) {
      tuitionFees = value;
      notifyListeners();
    });
  }
}
