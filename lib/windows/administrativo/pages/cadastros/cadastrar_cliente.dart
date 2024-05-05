import 'package:escritorio_advocacia_especilizado/core/controllers/events_controller.dart';
import 'package:escritorio_advocacia_especilizado/core/models/cliente.dart';
import 'package:escritorio_advocacia_especilizado/core/models/endereco.dart';
import 'package:escritorio_advocacia_especilizado/core/models/eventos.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import '../../../../core/controllers/cliente_service.dart';
import '../../../../utils/contantes.dart';
import '../../../../utils/widgets/colors_customs.dart';
import '../../../../utils/widgets/custom_text.dart';
import '../../../../utils/widgets/font_style.dart';
import '../../../../utils/widgets/ui_app_textfield.dart';
import '../../../../utils/widgets/ui_app_textfield_util.dart';
import '../../../../utils/widgets/ui_web_button.dart';
import '../../../../widgets/src/ui_dialog_web.dart';
import '../../home_page_adm.dart';

class CadastrarCliente extends StatefulWidget {
  const CadastrarCliente({Key? key}) : super(key: key);

  @override
  State<CadastrarCliente> createState() => _CadastrarClienteState();
}

class _CadastrarClienteState extends State<CadastrarCliente> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController tituloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return UIWhiteDialog(content: [
      SizedBox(
        height: 80,
        width: width(context: context, size: .43),
        child: CustomTextField(
          label: 'Nome',
          controller: tituloController,
          prefixIcon: const Icon(Mdi.accountCircle),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: width(context: context, size: .2),
            child: CustomTextField(
              label: 'E-mail',
              controller: tituloController,
              prefixIcon: const Icon(Mdi.accountCircle),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: width(context: context, size: .03)),
            child: SizedBox(
              height: 80,
              width: width(context: context, size: .2),
              child: CustomTextField(
                label: 'Data Nascimento',
                controller: tituloController,
                prefixIcon: const Icon(Mdi.accountCircle),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: width(context: context, size: .14),
            child: CustomTextField(
              label: 'Rg',
              controller: tituloController,
              prefixIcon: const Icon(Mdi.accountCircle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0.3,right: 0.3),
            child: SizedBox(
              height: 80,
              width: width(context: context, size: .14),
              child: CustomTextField(
                label: 'Cpf',
                controller: tituloController,
                prefixIcon: const Icon(Mdi.accountCircle),
              ),
            ),
          ),
          SizedBox(
            height: 80,
            width: width(context: context, size: .14),
            child: CustomTextField(
              label: 'Chave Pix',
              controller: tituloController,
              prefixIcon: const Icon(Mdi.accountCircle),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: width(context: context, size: .14),
            child: CustomTextField(
              label: 'Ctps',
              controller: tituloController,
              prefixIcon: const Icon(Mdi.accountCircle),
            ),
          ),
          SizedBox(
            height: 80,
            width: width(context: context, size: .14),
            child: CustomTextField(
              label: 'Cnh',
              controller: tituloController,
              prefixIcon: const Icon(Mdi.accountCircle),
            ),
          ),

          SizedBox(
            height: 80,
            width: width(context: context, size: .14),
            child: CustomTextField(
              label: 'Título Eleitor',
              controller: tituloController,
              prefixIcon: const Icon(Mdi.accountCircle),
            ),
          ),

        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: width(context: context, size: .2),
            child: CustomTextField(
              label: 'whatsApp',
              controller: tituloController,
              prefixIcon: const Icon(Mdi.accountCircle),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: width(context: context, size: .03)),
            child: SizedBox(
              height: 80,
              width: width(context: context, size: .2),
              child: CustomTextField(
                label: 'Telefone',
                controller: tituloController,
                prefixIcon: const Icon(Mdi.accountCircle),
              ),
            ),
          ),
        ],
      ),
      TextBold(text: 'Endereço',),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: width(context: context, size: .2),
            child: CustomTextField(
              label: 'Cep',
              controller: tituloController,
              prefixIcon: const Icon(Mdi.accountCircle),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: width(context: context, size: .03)),
            child: SizedBox(
              height: 80,
              width: width(context: context, size: .2),
              child: CustomTextField(
                label: 'Rua',
                controller: tituloController,
                prefixIcon: const Icon(Mdi.accountCircle),
              ),
            ),
          ),
        ],
      ), Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: width(context: context, size: .1),
            child: CustomTextField(
              label: 'Bairro',
              controller: tituloController,
              prefixIcon: const Icon(Mdi.accountCircle),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: width(context: context, size: .03)),
            child: SizedBox(
              height: 80,
              width: width(context: context, size: .1),
              child: CustomTextField(
                label: 'Cidade',
                controller: tituloController,
                prefixIcon: const Icon(Mdi.accountCircle),
              ),
            ),
          ), Padding(
            padding:  EdgeInsets.only(left: width(context: context, size: .03)),
            child: SizedBox(
              height: 80,
              width: width(context: context, size: .1),
              child: CustomTextField(
                label: 'Estado',
                controller: tituloController,
                prefixIcon: const Icon(Mdi.accountCircle),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
