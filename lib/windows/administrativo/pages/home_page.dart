import 'package:escritorio_advocacia_especilizado/windows/administrativo/pages/cadastros/cadastrar_sobre.dart';
import 'package:escritorio_advocacia_especilizado/windows/administrativo/pages/cadastros/cadastrar_socio.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../widgets/icon_details_painel.dart';
import 'cadastros/cadastrar_noticia.dart';

class CadastrosPage extends StatefulWidget {
  const CadastrosPage({super.key});

  @override
  State<CadastrosPage> createState() => _CadastrosPageState();
}

class _CadastrosPageState extends State<CadastrosPage> {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          IconCadastroDashboard(icon: Mdi.file, text: 'Noticias',function: (){ showDialog(
         context: context,
         builder: (BuildContext context) {
           return   const CadastrarNoticia();});
          },),
          IconCadastroDashboard(icon: Mdi.file, text: 'Sócios',function: (){showDialog(
              context: context,
              builder: (BuildContext context) {
                return   const CadastrarSocios();});},),
          IconCadastroDashboard(icon: Mdi.file, text: 'Sobre',function: (){showDialog(
              context: context,
              builder: (BuildContext context) {
                return   const CadastrarSobre();});},),
        ],
      ),
      Row(
        children: [
          IconCadastroDashboard(icon: Mdi.file, text: 'Noticias',function: (){},),
          IconCadastroDashboard(icon: Mdi.file, text: 'Noticias',function: (){},),
          IconCadastroDashboard(icon: Mdi.file, text: 'Noticias',function: (){},),
        ],
      ),

    ],);
  }
}
