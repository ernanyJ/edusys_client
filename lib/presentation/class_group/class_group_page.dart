import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class ClassGroupPage extends StatelessWidget {
  const ClassGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.width * .8,
                child: Column(
                  spacing: defaultInnerPad,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Pesquisar...',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                        ),
                        FiltroRadio()
                      ],
                    ),
                    Expanded(
                      child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) => Container(
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
                                  color: const Color.fromRGBO(33, 150, 243, 1),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Turma ${index + 101}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ),
                              )),
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
  const FiltroRadio({super.key});

  @override
  _FiltroRadioState createState() => _FiltroRadioState();
}

class _FiltroRadioState extends State<FiltroRadio> {
  String _selectedValue = 'fundamental';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: 'fundamental',
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
        const Text('Fundamental'),
        Radio<String>(
          value: 'creche',
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
        const Text('Creche'),
      ],
    );
  }
}
