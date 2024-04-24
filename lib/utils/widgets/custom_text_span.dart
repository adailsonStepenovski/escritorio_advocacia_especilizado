import 'package:flutter/cupertino.dart';

import 'colors_customs.dart';


class TextSpanThin extends TextSpan {
  final BuildContext? context;
  final String content;
  final Color color;
  final double fontSize;
  final FontStyle fontStyle;
  final TextDecoration decoration;

  const TextSpanThin(this.content,
      {this.context,
      this.fontSize = 36,
      this.color = CustomColors.textBlack,
      this.fontStyle = FontStyle.normal,
      this.decoration = TextDecoration.none})
      : super(text: content);

  @override
  TextStyle get style => TextStyle(
      fontSize: fontSize,
      color: color,
      fontStyle: fontStyle,
      decoration: decoration);
}

class TextSpanLight extends TextSpan {
  final BuildContext? context;
  final String content;
  final Color color;
  final double fontSize;
  final FontStyle fontStyle;
  final TextDecoration decoration;

  const TextSpanLight(this.content,
      {this.context,
      this.fontSize = 36,
      this.color = CustomColors.textBlack,
      this.fontStyle = FontStyle.normal,
      this.decoration = TextDecoration.none})
      : super(text: content);

  @override
  TextStyle get style => TextStyle(
      fontSize: fontSize,
      color: color,
      fontStyle: fontStyle,
      decoration: decoration);
}

class TextSpanRegular extends TextSpan {
  final BuildContext? context;
  final String content;
  final Color color;
  final double fontSize;
  final FontStyle fontStyle;
  final TextDecoration decoration;

  const TextSpanRegular(this.content,
      {this.context,
      this.fontSize = 36,
      this.color = CustomColors.textBlack,
      this.fontStyle = FontStyle.normal,
      this.decoration = TextDecoration.none})
      : super(text: content);

  @override
  TextStyle get style => TextStyle(
      fontSize: fontSize,
      color: color,
      fontStyle: fontStyle,
      decoration: decoration);
}

class TextSpanMedium extends TextSpan {
  final BuildContext? context;
  final String content;
  final Color color;
  final double fontSize;
  final FontStyle fontStyle;
  final TextDecoration decoration;

  const TextSpanMedium(this.content,
      {this.context,
      this.fontSize = 36,
      this.color = CustomColors.textBlack,
      this.fontStyle = FontStyle.normal,
      this.decoration = TextDecoration.none})
      : super(text: content);

  @override
  TextStyle get style => TextStyle(
      fontSize: fontSize,
      height: 1.5,
      color: color,
      fontStyle: fontStyle,
      decoration: decoration);
}

class TextSpanBold extends TextSpan {
  final BuildContext? context;
  final String content;
  final Color color;
  final double fontSize;
  final FontStyle fontStyle;
  final TextDecoration decoration;

  const TextSpanBold(this.content,
      {this.context,
      this.fontSize = 36,
      this.color = CustomColors.textBlack,
      this.fontStyle = FontStyle.normal,
      this.decoration = TextDecoration.none})
      : super(text: content);

  @override
  TextStyle get style => TextStyle(
      fontSize: fontSize,
      height: 1.5,
      color: color,
      fontStyle: fontStyle,
      decoration: decoration);
}
