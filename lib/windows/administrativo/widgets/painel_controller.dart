import 'package:escritorio_advocacia_especilizado/utils/contantes.dart';
import 'package:flutter/material.dart';

class PainelController extends StatelessWidget {
  const PainelController({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: Container(
        height: height(context: context, size: .03),
        width: width(context: context, size: 1),
        child: ElevatedButton(
          child: Text('novo'),
          onPressed: () {},
        ),
      ),
    );
  }
}
