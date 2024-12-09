import 'package:edusys_client/data/models/out/student_model_out.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';

abstract interface class StudentRepository {
  Future<List<StudentEntity>> getAllStudents();

  Future<void> deleteStudent(int id);

  Future<StudentEntity> updateStudent(int id, StudentModelOut student);
}
