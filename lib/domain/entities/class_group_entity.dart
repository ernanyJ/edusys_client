import 'package:edusys_client/enums/time_period_enum.dart';

class ClassGroupEntity {
  final int id;
  final String name;
  final String year;
  final TimePeriod timePeriod;
  final int capacity;
  final String room;

  ClassGroupEntity({
    required this.id,
    required this.name,
    required this.year,
    required this.timePeriod,
    required this.capacity,
    required this.room,
  });
}
