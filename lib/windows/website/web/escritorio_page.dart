import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_descricao.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_principal.dart';
import 'package:flutter/material.dart';

class EscritorioPage extends StatefulWidget {
  const EscritorioPage({super.key});

  @override
  State<EscritorioPage> createState() => _EscritorioPageState();
}

class _EscritorioPageState extends State<EscritorioPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      ContainerPrincipal(label: 'Escritorio',),
      ContainerDescricao(widget: [],)
    ],);}
}
