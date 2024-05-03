import 'package:flutter/material.dart';

double width({required BuildContext context, required double size}) {
  return MediaQuery.of(context).size.width * size;
}

double height({required BuildContext context, required double size}) {
  return MediaQuery.of(context).size.height * size;
}

String logo() {return"assets/logo_sem_fundo.png";}
String logoLosangulo() {return"assets/logo_losangulo.png";}
double fontSize({required BuildContext context}) {
  return MediaQuery.of(context).size.width <= 800
      ? 10
      :  16;
}
//MediaQuery.of(context).size.width * 0.015
