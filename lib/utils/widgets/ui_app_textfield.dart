import 'package:flutter/material.dart';

import '../contantes.dart';

class CustomTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final String? label;
  final String? errorText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    this.prefixIcon,
    this.label,
    this.errorText,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context: context, size: 0.05),
      width: width(context: context, size: 0.4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText!,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          labelText: label,
          prefixIcon: prefixIcon,
          errorText: errorText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}