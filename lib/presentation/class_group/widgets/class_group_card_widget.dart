import 'package:edusys_client/domain/entities/class_group_entity.dart';
import 'package:edusys_client/enums/class_group_type.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClassGroupCard extends StatelessWidget {
  const ClassGroupCard(
    this.classGroup, {
    super.key,
  });

  final ClassGroupEntity classGroup;

  @override
  build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        child: InkWell(
          onTap: () {
            context.go('/class-group/details/${classGroup.id}',
                extra: classGroup);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
              color: classGroup.type == ClassGroupType.ELEMENTARY
                  ? const Color.fromRGBO(33, 150, 243, 1)
                  : const Color.fromRGBO(255, 152, 0, 1),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                classGroup.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
