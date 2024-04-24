import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_descricao.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_principal.dart';
import 'package:flutter/material.dart';

class CompilancePage extends StatefulWidget {
  const CompilancePage({super.key});

  @override
  State<CompilancePage> createState() => _CompilancePageState();
}

class _CompilancePageState extends State<CompilancePage> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      ContainerPrincipal(label: 'Compilance',),
      ContainerDescricao(widget: [],)
    ],);}
}
