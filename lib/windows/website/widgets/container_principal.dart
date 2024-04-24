import 'package:flutter/material.dart';

import '../../../utils/contantes.dart';


class ContainerPrincipal extends StatelessWidget {
  final String label;

  const ContainerPrincipal({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  height(context: context, size: .4),
      width: double.infinity,
      child: Center(
        child: Stack(
          children: [
            Container(
                height:  height(context: context, size: .4),
                width: double.infinity,
                color: Colors.transparent.withOpacity(0.2),
                child: Image.asset('assets/capa.jpeg',
                  width: double.infinity,)),
            Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
