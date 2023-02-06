// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class CustomButtonSignUp extends StatelessWidget {
  const CustomButtonSignUp(
      {super.key,
      required this.height,
      required this.width,
      required this.color,
      required this.text,
      required this.onTap});
  final double height;
  final double width;
  final Color color;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: Container(
        height: height,
        width: width,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white),
        )),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
