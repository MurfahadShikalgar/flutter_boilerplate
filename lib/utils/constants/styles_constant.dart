// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:practice_application/utils/constants/color_constants.dart';

class Styles {
  
  static const TextStyle titleStyle =
      TextStyle(fontSize: 21, fontWeight: FontWeight.w500, color: Colors.white);

  static const TextStyle detailsTitleStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black);

  static const TextStyle detailsDescStyle = TextStyle(
      fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black38);

  static const TextStyle hintStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      color: Colors.black54);

  static const InputDecoration TextFieldDecoration = InputDecoration(
    hintStyle: Styles.hintStyle,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: enableBorderColor),
        borderRadius: BorderRadius.all(Radius.circular(8))),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: focusedBorderColor),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: errorBorderColor),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );

}
