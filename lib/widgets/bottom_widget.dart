import 'package:flutter/material.dart';
import '../utils/contantes.dart';

class BottomWidegt extends StatelessWidget {
  const BottomWidegt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height(context: context, size: .3),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF000000),
              Color(0xFF3533cd),
            ]
            // Adjust the colors as needed
            ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Image.asset(
                logo(),
                width: width(context: context, size: .35),
                height: height(context: context, size: .3),
              ),
            ),
             Padding(
              padding:const EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nosso Escritório',
                    style: TextStyle(fontSize: fontSize(context: context), color: Colors.white),
                  ),
                  Text(
                    'Castro - PR',
                    style: TextStyle(fontSize: fontSize(context: context), color: Colors.white),
                  ),
                  Text(
                    'Rua Maria Antônia Vileski, nº. 115, Salas 118,',
                    style: TextStyle(fontSize: fontSize(context: context), color: Colors.white),
                  ),
                  Text(
                    'Jardim Arapongas, Castro, PR, CEP 84174-250',
                    style: TextStyle(fontSize: fontSize(context: context), color: Colors.white),
                  ),
                  Text(
                    '(42) 9 9116-0111',
                    style: TextStyle(fontSize: fontSize(context: context), color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
