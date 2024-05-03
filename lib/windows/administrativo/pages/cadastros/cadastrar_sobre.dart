import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../../../../core/controllers/sobre_controller.dart';
import '../../../../core/models/sobre.dart';
import '../../../../utils/contantes.dart';
import '../../../../widgets/widgets/colors_customs.dart';
import '../../../../widgets/widgets/ui_app_textfield.dart';
import '../../../../widgets/widgets/ui_web_button.dart';

class CadastrarSobre extends StatefulWidget {
  const CadastrarSobre({super.key});

  @override
  State<CadastrarSobre> createState() => _CadastrarSobreState();
}

class _CadastrarSobreState extends State<CadastrarSobre> {
  TextEditingController tituloController = TextEditingController();
  TextEditingController subtituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

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
                      label: 'Título',
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
                      label: 'Subtitulo',
                      controller: subtituloController,
                      prefixIcon: const Icon(Mdi.lock),
                    ),
                  ),
                ), Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 24),
                  child: SizedBox(
                    height: 80,
                    child: CustomTextField(
                      label: 'Descricao',
                      controller: descricaoController,
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
                    final SobreService sobreService = SobreService();
                    sobreService.adicionarSobre(
                      Sobre(subtitulo: subtituloController.text,

                        titulo: tituloController.text,
                        descricao: descricaoController.text,
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(), deletedAt:  DateTime.now(),
                      ),
                    );
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
