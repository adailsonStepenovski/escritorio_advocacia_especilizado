import 'package:flutter/material.dart';
import 'package:escritorio_advocacia_especilizado/utils/contantes.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/widgets/ui_dialog.dart';

import 'package:mdi/mdi.dart';

import '../../../core/controllers/usuario_controller.dart';
import '../../../core/models/usuario.dart';
import '../../administrativo/home_page_adm.dart';


class AcessoRestritoPage extends StatefulWidget {
  const AcessoRestritoPage({super.key});

  @override
  State<AcessoRestritoPage> createState() => _AcessoRestritoPageState();
}

class _AcessoRestritoPageState extends State<AcessoRestritoPage> {
  TextEditingController emailController=TextEditingController(text: "adailsonprd@gmail.com");
  TextEditingController senhaController=TextEditingController(text: "senha123");
  @override
  Widget build(BuildContext context) {
    return GFCard(
      boxFit: BoxFit.cover,
      content:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Icon(
              Mdi.accountCircle,
              color: CustomColors.secondary,
              size:MediaQuery.of(context).size.width <= 1200
                  ?width(context: context, size: .05):width(context: context, size: .1,)
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
              padding: const EdgeInsets.only(top: 18.0, bottom: 24),
              child: SizedBox(
                height: 80,
                child: CustomTextField(
                  label: 'senha',
                  controller: senhaController,
                  prefixIcon: const Icon(
                    Mdi.lock,
                  ),
                ),
              ),
            ),
            UIAppButton(
                buttonHeight: height(context: context, size: 0.08),
                buttonWidth: width(context: context, size: 0.4),
                label: 'Acessar',
                isLoading: false,
                onPressed: () async {


                  userController
                      .efetuarLogin(
                      emailController.text, senhaController.text)
                      .then((Usuario? usuario) async {
                    if (usuario != null) {
                      if (usuario.permissao != 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePageAdm()),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => const UiDialog(
                            content: [
                              TextLight(
                                text: 'Usuário sem permissão!',
                              ),
                            ],
                          ),
                        );

                        final Future<void> delayedFuture =
                        Future.delayed(const Duration(seconds: 1));

                        await delayedFuture;

                        Navigator.of(context).pop();
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => const UiDialog(
                          content: [
                            TextLight(
                              text: 'Login Inexistente',
                            ),
                          ],
                        ),
                      );

                      final Future<void> delayedFuture =
                      Future.delayed(const Duration(seconds: 1));

                      await delayedFuture;

                      Navigator.pop(context);
                    }
                  });
                }),
          ],
        ),

    );}
}
