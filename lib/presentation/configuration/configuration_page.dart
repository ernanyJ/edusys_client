import 'package:edusys_client/core/config/config_state.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:edusys_client/util/consts.dart';
import 'package:flutter/material.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defaultPad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configuration Page',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: defaultPad),
                MyTextField(
                  label: 'Nome da instituição',
                  controller: ConfigState.schoolNameController,
                ),
                const SizedBox(height: defaultPad),
                MyTextField(
                  label: 'Endereço',
                  controller: ConfigState.addressController,
                ),
                const SizedBox(height: defaultPad),
                MyTextField(
                  label: 'Endereço API',
                  controller: ConfigState.apiAddressController,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
