import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_descricao.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_principal.dart';
import 'package:flutter/material.dart';

class FaleConoscoPage extends StatefulWidget {
  const FaleConoscoPage({super.key});

  @override
  State<FaleConoscoPage> createState() => _FaleConoscoPageState();
}

class _FaleConoscoPageState extends State<FaleConoscoPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      ContainerPrincipal(label: 'Fale Conosco',),
      ContainerDescricao(widget: [],)
    ],);}
}
