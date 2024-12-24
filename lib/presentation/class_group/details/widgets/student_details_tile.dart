import 'package:edusys_client/domain/entities/student_entity.dart';
import 'package:edusys_client/presentation/class_group/details/dialogs/student_edit_class_dialog.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class StudentDetailsTile extends StatelessWidget {
  const StudentDetailsTile({
    super.key,
    required this.student,
  });

  final StudentEntity student;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultInnerPad),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          child: ListTile(
            enableFeedback: true,
            title: Text(student.name),
            leading: const Icon(Icons.person),
            subtitle: Row(
              children: [
                Text(student.cpf),
                const Spacer(),
                Text(student.enrollment ?? ''),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StudentEditClassDialog(student: student);
                  },
                );
              },
              icon: const Icon(Icons.edit, size: 22),
            ),
          ),
        ),
      ),
    );
  }
}
