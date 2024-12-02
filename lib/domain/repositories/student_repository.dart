import 'package:edusys_client/domain/entities/student_entity.dart';

abstract interface class StudentRepository {
  
  Future<List<StudentEntity>> getAllStudents();
}