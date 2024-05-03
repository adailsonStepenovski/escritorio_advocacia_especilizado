
import 'package:escritorio_advocacia_especilizado/widgets/app_bar/ui_type_app.dart';
import 'package:flutter/material.dart';

import '../../utils/contantes.dart';
import '../widgets/colors_customs.dart';
import '../widgets/custom_text.dart';

class AppBarButtom extends StatelessWidget {
  final String? label;
  final String? title;
  final IconData? icon;
  final AppButtonTyper typer;
  final Function() onPressed;

  const AppBarButtom({
    super.key,
    this.label,
    required this.typer,
    this.title,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return typer == AppButtonTyper.icon
        ? Padding(
            padding: const EdgeInsets.only(left: .01, right: .01),
            child: SizedBox(
              width: width(context: context, size: .06),
              child: InkWell(
                onTap: onPressed,
                child: Icon(icon, color: Colors.white),
              ),
            ),
          )
        : IconButton(
            icon: SizedBox(
                width: width(context: context, size: .2),
                child: Wrap(
                  children: [
                    TextRegular(
                      text: "$title: ",
                      fontSize: fontSize(context: context),
                      fontColor: CustomColors.white,
                    ),
                    TextRegular(
                      text: label,
                      fontSize: fontSize(context: context),
                      fontColor: CustomColors.white,
                    ),
                  ],
                )),
            onPressed: onPressed);
  }
}
