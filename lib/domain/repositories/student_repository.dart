import 'package:edusys_client/core/page_model.dart';
import 'package:edusys_client/data/models/out/student_model_out.dart';
import 'package:edusys_client/domain/entities/student_entity.dart';

abstract interface class StudentRepository {
  Future<List<StudentEntity>> getAllStudents();

  Future<void> deleteStudent(int id);

  Future<StudentEntity> updateStudent(int id, StudentModelOut student);

  Future<int> countStudents();

  Future<int> countDebts();

  Future<List<StudentEntity>> getStudentsByClassGroup(int id);

  Future<void> updateStudentClass(int id, int classId);

  Future<PageModel<StudentEntity>> searchStudentsByQuery(
      String query, int page, int size);
      
  Future<PageModel<StudentEntity>> getStudentsPaginated(int page, int size);
}
