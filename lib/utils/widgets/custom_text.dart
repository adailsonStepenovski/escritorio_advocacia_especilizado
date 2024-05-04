import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_customs.dart';


class TextRegular extends StatelessWidget {
  const TextRegular(
      {this.onTap,
      this.text,
      this.fontSize = 36,
      this.fontColor,
      this.fontStyle,
      this.underline = false,
      super.key,
      this.textAlign});

  final Function()? onTap;
  final String? text;
  final double? fontSize;
  final Color? fontColor;
  final FontStyle? fontStyle;
  final bool? underline;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Text(text!,
            textAlign: textAlign ?? TextAlign.left,
            style: GoogleFonts.oldStandardTt(
                color: fontColor ?? CustomColors.textBlack,
                fontSize: fontSize,fontWeight: FontWeight.w500,
                fontStyle: fontStyle ?? FontStyle.normal,
                decoration: underline!
                    ? TextDecoration.underline
                    : TextDecoration.none)));
  }
}

class TextLight extends StatelessWidget {
  const TextLight(
      {this.onTap,
      this.text,
      this.fontSize = 36,
      this.fontColor,
      this.fontStyle,
      this.underline = false,
      super.key,
      this.textAlign});

  final Function()? onTap;
  final String? text;
  final double? fontSize;
  final Color? fontColor;
  final FontStyle? fontStyle;
  final bool? underline;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Text(text!,
            textAlign: textAlign ?? TextAlign.left,
            style: GoogleFonts.oldStandardTt(
                color: fontColor ?? CustomColors.textBlack,
                fontSize: fontSize,fontWeight: FontWeight.w300,
                fontStyle: fontStyle ?? FontStyle.normal,
                decoration: underline!
                    ? TextDecoration.underline
                    : TextDecoration.none)));
  }
}

class TextThin extends StatelessWidget {
  const TextThin(
      {this.onTap,
      this.text,
      this.fontSize = 36,
      this.fontColor,
      this.fontStyle,
      this.underline = false,
      super.key,
      this.textAlign});

  final Function()? onTap;
  final String? text;
  final double? fontSize;
  final Color? fontColor;
  final FontStyle? fontStyle;
  final bool? underline;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Text(text!,
            textAlign: textAlign ?? TextAlign.left,
            style:  GoogleFonts.oldStandardTt(
                color: fontColor ?? CustomColors.textBlack,
                fontSize: fontSize,fontWeight: FontWeight.w100,
                fontStyle: fontStyle ?? FontStyle.normal,
                decoration: underline!
                    ? TextDecoration.underline
                    : TextDecoration.none)));
  }
}

class TextMedium extends StatelessWidget {
  const TextMedium(
      {this.onTap,
      this.text,
      this.fontSize = 36,
      this.fontColor,
      this.fontStyle,
      this.underline = false,
      super.key,
      this.textAlign});

  final Function()? onTap;
  final String? text;
  final double? fontSize;
  final Color? fontColor;
  final FontStyle? fontStyle;
  final bool? underline;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Text(text!,
            textAlign: textAlign ?? TextAlign.left,
            style:  GoogleFonts.oldStandardTt(
                color: fontColor ?? CustomColors.textBlack,
                fontSize: fontSize,fontWeight: FontWeight.w500,
                fontStyle: fontStyle ?? FontStyle.normal,
                decoration: underline!
                    ? TextDecoration.underline
                    : TextDecoration.none)));
  }
}

class TextBold extends StatelessWidget {
  const TextBold(
      {this.onTap,
      this.text,
      this.fontSize = 36,
      this.fontColor,
      this.fontStyle,
      this.underline = false,
      super.key,
      this.textAlign});

  final Function()? onTap;
  final String? text;
  final double? fontSize;
  final Color? fontColor;
  final FontStyle? fontStyle;
  final bool? underline;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Text(text!,
            textAlign: textAlign ?? TextAlign.left,
            style:  GoogleFonts.oldStandardTt(
                color: fontColor ?? CustomColors.textBlack,
                fontSize: fontSize,
                fontStyle: fontStyle ?? FontStyle.normal,fontWeight: FontWeight.w700,
                decoration: underline!
                    ? TextDecoration.underline
                    : TextDecoration.none)));
  } }class TextExtraBold extends StatelessWidget {
  const TextExtraBold(
      {this.onTap,
      this.text,
      this.fontSize = 36,
      this.fontColor,
      this.fontStyle,
      this.underline = false,
      super.key,
      this.textAlign});

  final Function()? onTap;
  final String? text;
  final double? fontSize;
  final Color? fontColor;
  final FontStyle? fontStyle;
  final bool? underline;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Text(text!,
            textAlign: textAlign ?? TextAlign.left,
            style:  GoogleFonts.oldStandardTt(
                color: fontColor ?? CustomColors.textBlack,
                fontSize: fontSize,fontWeight: FontWeight.w900,
                fontStyle: fontStyle ?? FontStyle.normal,
                decoration: underline!
                    ? TextDecoration.underline
                    : TextDecoration.none)));
  }
}
