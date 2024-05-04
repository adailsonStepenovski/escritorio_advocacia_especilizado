import 'package:escritorio_advocacia_especilizado/core/controllers/socios_controller.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import '../../../../core/models/socios.dart';
import '../../../../utils/contantes.dart';
import '../../../../utils/widgets/colors_customs.dart';
import '../../../../utils/widgets/ui_app_textfield.dart';
import '../../../../utils/widgets/ui_web_button.dart';

class CadastrarSocios extends StatefulWidget {
  const CadastrarSocios({super.key});

  @override
  State<CadastrarSocios> createState() => _CadastrarSociosState();
}

class _CadastrarSociosState extends State<CadastrarSocios> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController funcaoController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

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
                      label: 'Nome do Sócio',
                      controller: nomeController,
                      prefixIcon: const Icon(Mdi.accountCircle),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 24),
                  child: SizedBox(
                    height: 80,
                    child: CustomTextField(
                      label: 'Função',
                      controller: funcaoController,
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
                ), Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 24),
                  child: SizedBox(
                    height: 80,
                    child: CustomTextField(
                      label: 'Telefone',
                      controller: telefoneController,
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
                    final SocioService socioService = SocioService();
                    socioService.adicionarSocio(
                      Socios(
                        nome: nomeController.text,
                        funcao: funcaoController.text,
                        telefone: telefoneController.text,
                        descricao: descricaoController.text,
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(), foto: '', deletedAt:  DateTime.now(),
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
