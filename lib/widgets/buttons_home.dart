import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../utils/contantes.dart';

class ButtonsHome extends StatefulWidget {
  final Function() onPressedHome;
  final Function() onPressedEscritorio;
  final Function() onPressedAreasAtuacao;
  final Function() onPressedAcessoRestrito;
  final Function() onPressedNoticias;
  final Function() onPressedFaleConosco;

  const

  ButtonsHome(
      {super.key,
      required this.onPressedHome,
      required this.onPressedEscritorio,
      required this.onPressedAreasAtuacao,
      required this.onPressedAcessoRestrito,
      required this.onPressedNoticias,
      required this.onPressedFaleConosco});

  @override
  State<ButtonsHome> createState() => _ButtonsHomeState();
}

class _ButtonsHomeState extends State<ButtonsHome> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context: context, size: .15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Image.asset(
              logoLosangulo(),
              width: width(context: context, size: .25),
              height: height(context: context, size: .3),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildIconButton('Home', Colors.red,Mdi.home, widget.onPressedHome),
              _buildIconButton(
                  'Escritório', Colors.blue,Mdi.desk, widget.onPressedEscritorio),
              _buildIconButton('Áreas de Atuação', Colors.green,Mdi.chat,
                  widget.onPressedAreasAtuacao),
              _buildIconButton(
                  'Notícias', Colors.purple,Mdi.fileDocument, widget.onPressedNoticias),
              _buildIconButton(
                  'Fale Conosco', Colors.yellow,Mdi.chat, widget.onPressedFaleConosco),
              _buildIconButton(
                  'Acesso Restrito', Colors.yellow,Mdi.chat, widget.onPressedAcessoRestrito),
            ],
          ),
        ],
      ),
    );
  }

    Widget _buildIconButton(String label, Color color, IconData icon, Function() onPressed) {
    return SizedBox(
      width: width(context: context, size: .12),
      child: IconButton(
        focusColor: const Color(0xFF092A53),
        icon: MediaQuery.of(context).size.width <= 800?Icon(icon):SizedBox(
            width: width(context: context, size: .12),
            child: Text(
              label,style: TextStyle(fontSize: fontSize(context: context)),
              textAlign: TextAlign.center,
            )),
        onPressed: onPressed,
      ),
    );
  }
}
