import 'package:edusys_client/core/config/config_entity.dart';
import 'package:edusys_client/presentation/class_group/details/class_group_details_state.dart';
import 'package:edusys_client/presentation/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FieldsStudentMoveWidget extends StatelessWidget {
  const FieldsStudentMoveWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context
          .read<ClassGroupDetailsState>()
          .moveStudentClassGroupKey,
      child: Column(
        children: [
          MyTextField(
            validation: (p0) => p0 == null || p0.isEmpty
                ? 'Justificativa é obrigatória'
                : null,
            label: 'Justificativa *',
            controller: context
                .read<ClassGroupDetailsState>()
                .justifyController,
          ),
          Visibility(
            visible: ConfigSingleton.getInstance()
                .askPasswordForClassChange,
            child: MyTextField(
              validation: (value) {
                var config = ConfigSingleton.getInstance();
        
                if (config.askPasswordForClassChange &&
                    value != config.securityPassword) {
                  return 'Senha incorreta';
                }
                return null;
              },
              label: 'Senha *',
              controller: context
                  .read<ClassGroupDetailsState>()
                  .askPasswordController,
            ),
          ),
        ],
      ),
    );
  }
}
