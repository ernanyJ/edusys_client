import 'package:edusys_client/domain/entities/class_group_entity.dart';
import 'package:edusys_client/presentation/class_group/details/class_group_details_state.dart';
import 'package:edusys_client/presentation/class_group/details/dialogs/student_edit_class_dialog.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:edusys_client/util/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassGroupDetailsPage extends StatefulWidget {
  const ClassGroupDetailsPage(this.classGroup, {super.key});

  final ClassGroupEntity classGroup;

  @override
  State<ClassGroupDetailsPage> createState() => _ClassGroupDetailsPageState();
}

class _ClassGroupDetailsPageState extends State<ClassGroupDetailsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<ClassGroupDetailsState>().init(widget.classGroup.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ClassGroupDetailsState>(context);
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: state.loadingState == LoadingState.LOADING
            ? Center(
                child: CircularProgressIndicator(color: primaryColor),
              )
            : Padding(
                padding: const EdgeInsets.all(defaultMainPad),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.classGroup.name,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Row(
                      children: [
                        // lista de estudantes daquela classe
                        StudentByClassList(state: state)
                        // detalhes da classe
                      ],
                    )
                  ],
                ),
              ));
  }
}

class StudentByClassList extends StatelessWidget {
  const StudentByClassList({
    super.key,
    required this.state,
  });

  final ClassGroupDetailsState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: defaultInnerPad,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 300,
          child: TextField(
            onChanged: (value) {
              state.searchStudentsByName(value);
            },
            decoration: const InputDecoration(
              hintText: 'Pesquisar...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          width: 700,
          height: MediaQuery.of(context).size.height * .75,
          child: ListView.separated(
            itemCount: state.filteredStudents.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(defaultInnerPad),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      enableFeedback: true,
                      title: Text(state.filteredStudents[index].name),
                      leading: const Icon(Icons.person),
                      subtitle: Text(state.filteredStudents[index].cpf),
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StudentEditClassDialog(
                                  student: state.filteredStudents[index]);
                            },
                          );
                        },
                        icon: const Icon(Icons.edit, size: 22),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        ),
      ],
    );
  }
}
