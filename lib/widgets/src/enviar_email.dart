import 'package:escritorio_advocacia_especilizado/widgets/src/ui_dialog_web.dart';

import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../../utils/contantes.dart';
import '../../utils/launchs/url_launch.dart';
import '../../utils/widgets/ui_app_textfield.dart';
import '../../utils/widgets/ui_web_button.dart';

class EnviarEmail extends StatefulWidget {
  final String email;

  const EnviarEmail({super.key, required this.email});

  @override
  State<EnviarEmail> createState() => _EnviarEmailState();
}

class _EnviarEmailState extends State<EnviarEmail> {
  TextEditingController descricaoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController assuntoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.text=widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return UIWhiteDialog( width: MediaQuery.of(context).size.width * .4,
      height: MediaQuery.of(context).size.height * .7,
      content: [
        Padding(
        padding: const EdgeInsets.only(top:16.0, ),
    child: SizedBox(
          height: 80,
          child: CustomTextField(
            label: 'Email',
            maxLines: 5,enabled: false,
            controller: emailController,
            prefixIcon: const Icon(Mdi.email),
          ),
        ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:32.0,bottom:32 ),
          child: SizedBox(
            height: 80,
            child: CustomTextField(
              label: 'Assunto',
              maxLines: 5,
              controller: assuntoController,
              prefixIcon: const Icon(Mdi.listStatus),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:32.0,bottom:32 ),
          child: SizedBox(
            height: 80,
            child: CustomTextField(
              label: 'Descrição',
              maxLines: 5,
              controller: descricaoController,
              prefixIcon: const Icon(Mdi.listStatus),
            ),
          ),
        ),
        UIAppButton(
          buttonHeight: height(context: context, size: 0.08),
          buttonWidth: width(context: context, size: 0.2),
          label: 'Enviar',
          isLoading: false,
          onPressed: () async {
            launchEmail(
                email: widget.email, descricao: descricaoController.text,assunto: assuntoController.text);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
