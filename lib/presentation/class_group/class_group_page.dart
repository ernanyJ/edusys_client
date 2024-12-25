import 'package:edusys_client/presentation/class_group/class_group_page_state.dart';
import 'package:edusys_client/presentation/class_group/widgets/class_group_card_widget.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:edusys_client/util/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassGroupPage extends StatefulWidget {
  const ClassGroupPage({super.key});

  @override
  State<ClassGroupPage> createState() => _ClassGroupPageState();
}

class _ClassGroupPageState extends State<ClassGroupPage> {
  @override
  void initState() {
    Future.microtask(() {
      if (!mounted) return;
      if (context.read<ClassGroupPageState>().classGroups.isEmpty) {
        context.read<ClassGroupPageState>().getClassGroups();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ClassGroupPageState>(context);
    return Padding(
      padding: const EdgeInsets.all(defaultMainPad),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Turmas',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: state.loadingState == LoadingState.LOADING
                  ? CircularProgressIndicator(color: primaryColor)
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * .8,
                      width: MediaQuery.of(context).size.width * .8,
                      child: Column(
                        spacing: defaultInnerPad,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () => state.getClassGroups(),
                                  child: const Text('Recarregar turmas')),
                              const Spacer(),
                              const SizedBox(
                                width: 300,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Pesquisar...',
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                  ),
                                ),
                              ),
                              FiltroRadio(onChanged: (value) {
                                state.filterClassGroups(value);
                              }),
                            ],
                          ),
                          Expanded(
                            child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: state.viewClassGroups.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) => ClassGroupCard(
                                    state.viewClassGroups[index])),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class FiltroRadio extends StatefulWidget {
  const FiltroRadio({super.key, required this.onChanged});

  final Function(String?) onChanged;

  @override
  FiltroRadioState createState() => FiltroRadioState();
}

class FiltroRadioState extends State<FiltroRadio> {
  String _selectedValue = 'ALL';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio<String>(
              value: 'ALL',
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                  widget.onChanged(value);
                });
              },
            ),
            const Text('Todos'),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'ELEMENTARY',
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(
                  () {
                    _selectedValue = value!;
                    widget.onChanged(value);
                  },
                );
              },
            ),
            const Text('Fundamental'),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'CRECHE',
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                  widget.onChanged(value);
                });
              },
            ),
            const Text('Creche'),
          ],
        ),
      ],
    );
  }
}
