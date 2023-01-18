// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFieldSignupWidget extends StatelessWidget {
  const TextFieldSignupWidget(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.icon,
      this.obscureText = false, this.textInputType  = TextInputType.name});
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(width: 2.0, color: Colors.black26)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(width: 2.0, color: Colors.blue)),
      ),
    );
  }
}
