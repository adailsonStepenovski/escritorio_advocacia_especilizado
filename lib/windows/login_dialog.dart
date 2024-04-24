import 'package:escritorio_advocacia_especilizado/utils/contantes.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../utils/controllers/usuario_controller.dart';
import '../utils/models/usuario.dart';
import '../utils/widgets/colors_customs.dart';
import '../utils/widgets/ui_app_textfield.dart';
import '../utils/widgets/ui_app_textfield_util.dart';
import '../utils/widgets/ui_web_button.dart';
import 'administrativo/home_page_adm.dart';

class LoginImputWidget extends StatefulWidget {
  const LoginImputWidget({super.key});

  @override
  State<LoginImputWidget> createState() => _LoginImputWidgetState();
}

class _LoginImputWidgetState extends State<LoginImputWidget> {
  TextEditingController senhaController =
      TextEditingController(text: "juridicoTeste");
  TextEditingController emailController =
      TextEditingController(text: "juridicoTeste@teste.com");

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          height: height(context: context, size: 0.6),
          width: width(context: context, size: 0.5),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: CustomColors.linearGradinet
                // Adjust the colors as needed
                ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Mdi.accountCircle,
                  color: CustomColors.secondary,
                  size: 56,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    height: 80,
                    child: CustomTextField(
                      label: 'login',
                      controller: emailController,
                      prefixIcon: Icon(
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
                      prefixIcon: Icon(
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
                          .then((Usuario? usuario) {
                        if (usuario != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePageAdm()),
                          );
                        } else {
                          print('Caiu no nullo');
                        }
                      });
                    }),
              ],
            ),
          ),
        ));
  }
}
