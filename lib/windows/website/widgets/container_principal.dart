import 'package:escritorio_advocacia_especilizado/utils/widgets/colors_customs.dart';
import 'package:flutter/material.dart';

import '../../../utils/contantes.dart';
import '../../../utils/widgets/custom_text.dart';


class ContainerPrincipal extends StatelessWidget {
  final String label;

  const ContainerPrincipal({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  height(context: context, size: .4),
      width: double.infinity,color: Colors.transparent.withOpacity(0.2),
      child: Stack(
        children: [
          Align(alignment: Alignment.centerRight,
            child: SizedBox(
                height:  height(context: context, size: .4),


                child: Image.asset('assets/capa_sem_fundo.png',
                  )),
          ),
          Center(
            child: TextBold(text:
              label,
              textAlign: TextAlign.center,

                fontSize: 86,
                fontColor: CustomColors.white,

            ),
          ),
        ],
      ),
    );
  }
}
