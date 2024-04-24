import 'package:flutter/material.dart';

enum APPTextFieldType { NULL, UNOMED, SENHA, CONFIRMESENHA, EMAIL }

class APPTextFieldUtil {
  static const fieldMap = {
    "label": String,
    "icon": Widget,
    "required": bool,
    "suffixIcon": Widget
  };

  static setTextFieldConfig(APPTextFieldType type) {
    _map({String? label, Widget? icon, bool? required, Widget? suffixIcon}) => {
          "label": label,
          "icon": icon,
          "required": required,
          "suffixIcon": suffixIcon
        };

    switch (type) {
      case APPTextFieldType.NULL:
        return null;
      case APPTextFieldType.UNOMED:
        return _map(
            label: "Unomed",
            //icon: Assets.images.icons.itemConsumo.svg(height: 80),
            required: true);
      case APPTextFieldType.SENHA:
        return _map(
            label: "Senha",
            //icon: Assets.images.icons.itemConsumo.svg(height: 80),
            required: true);
      case APPTextFieldType.CONFIRMESENHA:
        return _map(
            label: "Confirme a senha",
            //icon: Assets.images.icons.itemConsumo.svg(height: 80),
            required: true);
      case APPTextFieldType.EMAIL:
        return _map(
            label: "E-mail",
            //icon: Assets.images.icons.itemConsumo.svg(height: 80),
            required: true);
    }
  }
}
