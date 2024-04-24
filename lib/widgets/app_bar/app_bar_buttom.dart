import 'package:flutter/material.dart';

import '../../utils/contantes.dart';

class AppBarButtom extends StatelessWidget {
  final String label;
  final String title;
  final Function() onPressed;

  const AppBarButtom(
      {super.key,
      required this.label,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: SizedBox(
            width: width(context: context, size: .15),
            child: Wrap(
              children: [
                Text(
                  "$title: ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize(context: context)),
                ),  Text(
                  label,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize(context: context)),
                ),
              ],
            )),
        onPressed: onPressed);
  }
}
