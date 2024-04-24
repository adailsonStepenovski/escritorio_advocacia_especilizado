import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_descricao.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_principal.dart';
import 'package:flutter/material.dart';

class NoticiasPage extends StatefulWidget {
  const NoticiasPage({super.key});

  @override
  State<NoticiasPage> createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      ContainerPrincipal(label: 'Notícias',),
      ContainerDescricao(widget: [],)
    ],);}
}
