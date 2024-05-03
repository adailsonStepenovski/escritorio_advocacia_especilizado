import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_principal.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import '../../../core/controllers/fale_conosco_controller.dart';
import '../../../core/models/fale_conosco.dart';
import '../../../utils/contantes.dart';
import '../../../utils/widgets/ui_app_textfield.dart';
import '../../../utils/widgets/ui_card.dart';
import '../../../utils/widgets/ui_web_button.dart';

class FaleConoscoPage extends StatefulWidget {
  const FaleConoscoPage({super.key});

  @override
  State<FaleConoscoPage> createState() => _FaleConoscoPageState();
}

class _FaleConoscoPageState extends State<FaleConoscoPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController mensagemController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ContainerPrincipal(
          label: 'Fale Conosco',
        ),
        GFCard(
          boxFit: BoxFit.cover,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 18.0,
                ),
                child: SizedBox(
                  height: 80,
                  child: CustomTextField(
                    label: 'nome',
                    controller: nomeController,
                    prefixIcon: const Icon(
                      Mdi.lock,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: SizedBox(
                  height: 80,
                  child: CustomTextField(
                    label: 'Email',
                    controller: emailController,
                    prefixIcon: const Icon(
                      Mdi.accountCircle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: SizedBox(
                  height: 80,
                  child: CustomTextField(
                    label: 'Telefone',
                    controller: telefoneController,
                    prefixIcon: const Icon(
                      Mdi.cellphone,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                child: SizedBox(
                  height: 80,
                  child: CustomTextField(
                    label: 'Mensagem',
                    maxLines: 5,
                    controller: mensagemController,
                    prefixIcon: const Icon(
                      Mdi.chat,
                    ),
                  ),
                ),
              ),
              UIAppButton(
                  buttonHeight: height(context: context, size: 0.08),
                  buttonWidth: width(context: context, size: 0.4),
                  label: 'Enviar',
                  isLoading: false,
                  onPressed: () async {
                    FaleConosco faleConosco = FaleConosco(
                        createdAt: DateTime.now(),
                        email: emailController.text,
                        mensagem: mensagemController.text,
                        nome: nomeController.text,
                        telefone: telefoneController.text);
                    final FaleConoscoService faleConoscoService =
                        FaleConoscoService();

                    faleConoscoService.adicionarFaleConosco(faleConosco);
                    emailController.clear();
                    mensagemController.clear();
                    nomeController.clear();
                    telefoneController.clear();
                  }),
            ],
          ),
        )
      ],
    );
  }
}
