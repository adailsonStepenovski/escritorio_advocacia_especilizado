import 'package:escritorio_advocacia_especilizado/core/models/cliente.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../../../../../utils/launchs/url_launch.dart';
import '../../../../../utils/widgets/custom_text.dart';
import '../../../../../widgets/src/enviar_email.dart';

class ClienteDetails extends StatelessWidget {
  final Cliente cliente;
  const ClienteDetails( {super.key,required this.cliente,});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextMedium(
            text: cliente.nome,
            fontSize: 18.0,
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.only(top:2.0,bottom: 2),
            child: Row(
              children: [
                const Icon(
                  Mdi.email,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextMedium(
                    onTap: cliente.email.isEmpty
                        ? () {}
                        : () {
                      showDialog(
                          context: context,
                          builder:
                              (BuildContext context) {
                            return  EnviarEmail(
                                email: cliente.email);
                          });
                    },
                    text: cliente.email,
                    fontSize: 15.0,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(
                Mdi.whatsapp,
                color: Colors.green,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextMedium(
                onTap: () => {
                  launchUrlWhatsApp(
                      celular:
                      cliente.telefone)
                },
                text:cliente.telefone,
                textAlign: TextAlign.start,
                fontSize: 15.0,
              ),
              ),
              const TextMedium(
                text: ' / ',
                fontSize: 15.0,
              ),
              TextMedium(
                text:cliente.telefoneComercial,
                textAlign: TextAlign.start,
                fontSize: 15.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
