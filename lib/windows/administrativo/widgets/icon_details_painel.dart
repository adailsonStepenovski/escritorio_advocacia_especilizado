import 'package:escritorio_advocacia_especilizado/utils/contantes.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/widgets/colors_customs.dart';

class IconCadastroDashboard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() function;

  const IconCadastroDashboard(
      {super.key,
        required this.icon,
        required this.text,
        required this.function,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: height(context: context, size: .3),
        width: height(context: context, size: .29),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
            ),
        child: InkWell(
          onTap: function,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18,
                  color: CustomColors.primary,
                ),
              ),
              Container(
                width: width(context: context, size: 0.075),
                height: height(context: context, size: 0.15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    ),child:Icon(icon) ,
              )



            ],
          ),
        ),
      ),
    );
  }
}
