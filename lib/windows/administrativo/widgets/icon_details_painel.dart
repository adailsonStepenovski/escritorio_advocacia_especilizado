import 'package:escritorio_advocacia_especilizado/utils/contantes.dart';
import 'package:flutter/material.dart';

import '../../../utils/widgets/colors_customs.dart';

class IconDashboard extends StatelessWidget {
  final IconData icon;
  final bool iconTyper;
  final String text;
  final String valor;
  final List<Widget> widget;
  final Color colorTitle;
  final Color colorSelected;
  final Function() function;

  const IconDashboard(
      {super.key,
        required this.icon,
        required this.text,
        required this.function,
        required this.iconTyper,
        required this.colorTitle,
        required this.colorSelected,
        required this.widget, required this.valor});

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
            color: colorSelected),
        child: InkWell(
          onTap: function,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  color: colorTitle,
                ),
              ),
              iconTyper == true
                  ? Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: colorSelected),
              )
                  : Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: width(context: context, size: 0.075),
                    height: height(context: context, size: 0.15),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(width(
                          context: context,
                          size:
                          0.15)),
                    ),
                  ),
                  Text(
                    valor,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      color: colorTitle,
                    ),
                  ),
                ],
              ),
              Container(
                height: height(context: context, size: 0.1),
                child: Column(
                  children: widget,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
