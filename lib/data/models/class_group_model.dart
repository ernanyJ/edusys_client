import 'package:edusys_client/data/models/student_model.dart';
import 'package:edusys_client/enums/time_period_enum.dart';

class ClassGroupModel {
  final int id;
  final String name;
  final String year;
  final TimePeriod timePeriod;
  final int capacity;
  final String room;

  ClassGroupModel({
    required this.id,
    required this.name,
    required this.year,
    required this.timePeriod,
    required this.capacity,
    required this.room,
  });

  // Método para converter de JSON para ClassGroupModel
  factory ClassGroupModel.fromJson(Map<String, dynamic> json) {
    return ClassGroupModel(
      id: json['id'] as int,
      name: json['name'] as String,
      year: json['year'] as String,
      timePeriod: TimePeriod.values.firstWhere(
          (e) => e.toString().split('.').last == json['timePeriod']),
      capacity: json['capacity'] as int,
      room: json['room'] as String,
    );
  }

  // Método para converter ClassGroupModel para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'year': year,
      'timePeriod': timePeriod.toString().split('.').last,
      'capacity': capacity,
      'room': room,
    };
  }
}
