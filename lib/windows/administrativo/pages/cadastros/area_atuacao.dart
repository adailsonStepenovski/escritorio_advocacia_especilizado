import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../../../../utils/contantes.dart';
import '../../../../utils/widgets/colors_customs.dart';
import '../../../../utils/widgets/ui_app_textfield.dart';
import '../../../../utils/widgets/ui_web_button.dart';

class CadastrarAreaAtuacao extends StatefulWidget {
  const CadastrarAreaAtuacao({super.key});

  @override
  State<CadastrarAreaAtuacao> createState() => _CadastrarAreaAtuacaoState();
}

class _CadastrarAreaAtuacaoState extends State<CadastrarAreaAtuacao> {
  TextEditingController tituloController = TextEditingController();
  TextEditingController subtituloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        child: Container(
          height: height(context: context, size: 1),
          width: width(context: context, size: 0.5),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: CustomColors.linearGradinet,
              // Adjust the colors as needed
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    height: 80,
                    child: CustomTextField(
                      label: 'Areas',
                      controller: tituloController,
                      prefixIcon: const Icon(Mdi.accountCircle),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 24),
                  child: SizedBox(
                    height: 80,
                    child: CustomTextField(
                      label: 'Especificacões',
                      controller: subtituloController,
                      prefixIcon: const Icon(Mdi.lock),
                    ),
                  ),
                ),
        
                UIAppButton(
                  buttonHeight: height(context: context, size: 0.08),
                  buttonWidth: width(context: context, size: 0.2),
                  label: 'Cadastrar',
                  isLoading: false,
                  onPressed: () async {

                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
