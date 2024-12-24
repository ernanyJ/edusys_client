import 'package:edusys_client/domain/entities/class_group_entity.dart';
import 'package:edusys_client/presentation/class_group/details/class_group_details_state.dart';
import 'package:edusys_client/presentation/class_group/details/widgets/student_details_tile.dart';
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.classGroup.name,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // lista de estudantes daquela classe
                        const StudentByClassList(),
                        // detalhes da classe
                        Padding(
                          padding: const EdgeInsets.all(defaultMainPad * 2.3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sala:',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(widget.classGroup.room,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: neutralColor)),
                              const SizedBox(height: defaultInnerPad),
                              Text(
                                'Período:',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(widget.classGroup.timePeriod.value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: neutralColor)),
                              const SizedBox(height: defaultInnerPad),
                              Text('Capacidade:',
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                              Text(widget.classGroup.capacity.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: neutralColor)),
                              const SizedBox(height: defaultInnerPad),
                              Text(
                                'Ano:',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(widget.classGroup.year,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: neutralColor)),
                              const SizedBox(height: defaultInnerPad),
                              Text(
                                'Tipo:',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(widget.classGroup.type.value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: neutralColor)),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class StudentByClassList extends StatelessWidget {
  const StudentByClassList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<ClassGroupDetailsState>(context);
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
              return StudentDetailsTile(student: state.filteredStudents[index]);
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
