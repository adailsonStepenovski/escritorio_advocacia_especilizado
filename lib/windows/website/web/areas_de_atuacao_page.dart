import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_descricao.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_principal.dart';
import 'package:flutter/material.dart';

class AreaDeAtuacaoPage extends StatefulWidget {
  const AreaDeAtuacaoPage({super.key});

  @override
  State<AreaDeAtuacaoPage> createState() => _AreaDeAtuacaoPageState();
}

class _AreaDeAtuacaoPageState extends State<AreaDeAtuacaoPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      ContainerPrincipal(label: 'Áreas de Atuação',),
      ContainerDescricao(widget: [],)
    ],);}
}
