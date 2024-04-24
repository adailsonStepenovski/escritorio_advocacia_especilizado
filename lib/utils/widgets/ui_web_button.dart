
import 'package:flutter/material.dart';

import 'custom_text.dart';


class UIAppButton extends StatelessWidget {
  const UIAppButton(
      {super.key,
      this.isLoading,
      this.isColor = false,
      @required this.onPressed,
      this.label,
      this.preffixIcon,
      this.suffixIcon,
      this.fontSize,
      this.buttonWidth,
      this.buttonHeight,
      this.verticalPadding,
      this.square = false});

  final EdgeInsetsGeometry? verticalPadding;
  final String? label;
  final Widget? preffixIcon;
  final Widget? suffixIcon;
  final void Function()? onPressed;
  final bool? isLoading;
  final bool? isColor;
  final double? fontSize;
  final double? buttonWidth;
  final double? buttonHeight;
  final bool? square;

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Colors.green;
    const borderColor = Colors.green;
    const fontColor = Colors.white;
    final text = label;
    final icon = preffixIcon;

    return Container(
        constraints:
            BoxConstraints(maxWidth: buttonWidth ?? 944, minWidth: 300),
        height: buttonHeight ?? 148,
        child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => backgroundColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        side: const BorderSide(width: 2, color: borderColor)))),
            onPressed: onPressed,
            child: Container(
                padding: verticalPadding ??
                    const EdgeInsets.only(left: 16, right: 16),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  if (icon != null)
                    Expanded(
                      flex: 3,
                      child: Align(alignment: Alignment.center, child: icon),
                    ),
                  (icon != null || suffixIcon != null)
                      ? const SizedBox(
                          width: 32,
                        )
                      : Container(),
                  (icon != null || suffixIcon != null)
                      ? Expanded(
                          flex: 8,
                          child: TextMedium(
                              text: text,
                              fontSize: fontSize ?? 22,
                              fontColor: fontColor))
                      : Center(
                          child: TextMedium(
                              text: text,
                              fontSize: fontSize ?? 22,
                              fontColor: fontColor)),
                  if (suffixIcon != null)
                    Expanded(
                      flex: 4,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(child: suffixIcon)),
                    ),
                ]))));
  }
}
