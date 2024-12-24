import 'package:edusys_client/presentation/class_group/details/class_group_details_state.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassesDropdownWidget extends StatelessWidget {
  const ClassesDropdownWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var state = context.watch<ClassGroupDetailsState>();
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          const Text('Selecione a nova turma:'),
          DropdownButton<String>(
            value: context
                .watch<ClassGroupDetailsState>()
                .selectedClass,
            alignment: Alignment.centerRight,
            items: [
              ...state.classes.map((e) => DropdownMenuItem(
                    value: e.id.toString(),
                    child: Text(e.name),
                  ))
            ],
            onChanged: (value) {
              state.setSelectedClass(value);
            },
          ),
          Visibility(
              visible: context
                      .watch<ClassGroupDetailsState>()
                      .selectedClass ==
                  null,
              child: Text('Selecione uma turma.',
                  style: TextStyle(color: dangerColor))),
        ],
      ),
    );
  }
}
