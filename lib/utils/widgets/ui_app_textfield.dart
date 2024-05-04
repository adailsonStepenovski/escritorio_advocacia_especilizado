import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../contantes.dart';

class CustomTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final String? label;
  final String? errorText;
  final int? maxLines;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.label,
    this.errorText,
    this.obscureText,
    this.keyboardType,
    this.controller, this.maxLines=1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, obscureText: obscureText ?? false,keyboardType: keyboardType,maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
        errorText: errorText,
        labelStyle:  GoogleFonts.oldStandardTt(fontSize: MediaQuery.of(context).size.width <= 1200
        ?width(context: context, size: .015):width(context: context, size: .01,)),
        // Tamanho do texto acima do campo de entrada
        border: OutlineInputBorder(
          // Borda do campo de entrada
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16), // Espaçamento interno do campo de entrada
      ),
      style: GoogleFonts.oldStandardTt(
          fontSize: MediaQuery.of(context).size.width <= 1200
    ?width(context: context, size: .015):width(context: context, size: .01)), // Tamanho do texto dentro do campo de entrada
    );
  }
}
