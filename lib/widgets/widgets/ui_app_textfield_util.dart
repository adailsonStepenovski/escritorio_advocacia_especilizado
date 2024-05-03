import 'package:flutter/material.dart';

enum APPTextFieldType { nulo, senha, confirmeSenha, email }

class APPTextFieldUtil {
  static const fieldMap = {
    "label": String,
    "icon": Widget,
    "required": bool,
    "suffixIcon": Widget
  };

  static setTextFieldConfig(APPTextFieldType type) {
    map({String? label, Widget? icon, bool? required, Widget? suffixIcon}) => {
          "label": label,
          "icon": icon,
          "required": required,
          "suffixIcon": suffixIcon
        };

    switch (type) {
      case APPTextFieldType.nulo:
        return null;
      case APPTextFieldType.senha:
        return map(
            label: "Senha",
            //icon: Assets.images.icons.itemConsumo.svg(height: 80),
            required: true);
      case APPTextFieldType.confirmeSenha:
        return map(
            label: "Confirme a senha",
            //icon: Assets.images.icons.itemConsumo.svg(height: 80),
            required: true);
      case APPTextFieldType.email:
        return map(
            label: "E-mail",
            //icon: Assets.images.icons.itemConsumo.svg(height: 80),
            required: true);
    }
  }
}
class TextFieldConfig {
  String? label;
  Widget? icon;
  bool? isRequired;
  Widget? suffixIcon;

  TextFieldConfig({this.label, this.icon, this.isRequired, this.suffixIcon});
}
