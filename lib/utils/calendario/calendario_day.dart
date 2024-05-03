import 'package:flutter/material.dart';

String mesPorExtenso(int mes) {
  switch (mes) {
    case 1:
      return 'Janeiro';
    case 2:
      return 'Fevereiro';
    case 3:
      return 'Março';
    case 4:
      return 'Abril';
    case 5:
      return 'Maio';
    case 6:
      return 'Junho';
    case 7:
      return 'Julho';
    case 8:
      return 'Agosto';
    case 9:
      return 'Setembro';
    case 10:
      return 'Outubro';
    case 11:
      return 'Novembro';
    case 12:
      return 'Dezembro';
    default:
      return '';
  }
}
TextStyle dateTextStyle() {
  return const TextStyle(
    fontSize: 16, // Increase the font size here
    color: Colors.black,
  );
}
Color statusDaAgenda(int status) {
  switch (status) {
    case 0:
      return Colors.grey;
    case 1:
      return Colors.blue;
    case 2:
      return Colors.green;
    case 3:
      return Colors.orange;
    case 4:
      return Colors.yellow;
    case 5:
      return Colors.red;

    default:
      return Colors.black;
  }
}
int statusColorsDaAgenda(Colors status) {
  switch (status) {
    case Colors.grey:
      return 0;
    case Colors.blue:
      return 1;
    case Colors.green:
      return 2;
    case Colors.orange:
      return 3;
    case Colors.yellow:
      return 4;
    case Colors.red:
      return 5;

    default:
      return 0;
  }
}

bool isSameDayCustoms(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
