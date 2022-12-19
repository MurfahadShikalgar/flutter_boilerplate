import 'package:flutter/material.dart';
import 'package:practice_application/utils/constants/styles_constant.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget(
      {super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: Styles.TextFieldDecoration.copyWith(hintText: hintText),
    );
  }
}
