import 'package:flutter/material.dart';

import '../../../../widgets/widgets/colors_customs.dart';

class IconDashboard extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconDashboard({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            icon,
            color: CustomColors.white,
            size: 20,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 18,
            color: CustomColors.white,
          ),
        ),
      ],
    );
  }
}
