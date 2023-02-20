import 'package:flutter/material.dart';
import 'package:practice_application/controllers/theme_controller.dart';
import 'package:practice_application/utils/constants/styles_constant.dart';
import 'package:get/get.dart';

class TextfieldWidget extends StatelessWidget {
  TextfieldWidget(
      {super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;
  final GetxStateManager _controller = Get.put(GetxStateManager());
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: Styles.TextFieldDecoration.copyWith(
          hintText: hintText, hintStyle: _controller.themeStatus == false ? Styles.hintStyle : Styles.hintStyleDark),
    );
  }
}
