import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:no_wait/style/app_colors.dart';

class InputTexto extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const InputTexto(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.corPrincipal),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.corPrincipal),
        ),
        hintText: hintText,
      ),
      inputFormatters: inputFormatters,
    );
  }
}
