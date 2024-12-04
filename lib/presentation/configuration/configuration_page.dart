import 'package:edusys_client/core/config/config_entity.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defaultMainPad),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {
                      bool apiAddressChanged =
                          ConfigSingleton.getInstance().apiAddress !=
                              ConfigSingleton.getInstance()
                                  .apiAddressController
                                  .text;

                      ConfigSingleton.getInstance().schoolName =
                          ConfigSingleton.getInstance()
                              .schoolNameController
                              .text;
                      ConfigSingleton.getInstance().schoolAddress =
                          ConfigSingleton.getInstance()
                              .schoolAddressController
                              .text;
                      ConfigSingleton.getInstance().apiAddress =
                          ConfigSingleton.getInstance()
                              .apiAddressController
                              .text;

                      if (apiAddressChanged) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            padding: EdgeInsets.all(defaultMainPad),
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                                'Endereço da API alterado. Reinicie o aplicativo para aplicar as mudanças.'),
                          ),
                        );
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          padding: EdgeInsets.all(defaultMainPad),
                          behavior: SnackBarBehavior.floating,
                          content: Text('Configurações salvas com sucesso.'),
                        ),
                      );
                    },
                    child: const Text('Salvar'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Configurações da instituição',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(width: defaultInnerPad),
                      Tooltip(
                        message:
                            'Configurações utilizadas na geração de contrato.',
                        child: Icon(
                          Icons.help,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultMainPad),
                  MyTextField(
                    label: 'Nome da instituição',
                    controller:
                        ConfigSingleton.getInstance().schoolNameController,
                  ),
                  MyTextField(
                    label: 'Endereço da instituição',
                    controller:
                        ConfigSingleton.getInstance().schoolAddressController,
                  ),
                  const MyTextField(
                      label: 'Nome do responsável da escola', controller: null),
                  const SizedBox(
                    height: defaultMainPad,
                  ),
                  Text(
                    'Outras configurações',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  MyTextField(
                    label: 'Endereço API',
                    controller:
                        ConfigSingleton.getInstance().apiAddressController,
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
