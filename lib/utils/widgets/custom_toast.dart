// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> ShowCustomToast(String msg, Color backgroundColor) {
  return Fluttertoast.showToast(
    msg: "Sayali is clever",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: Colors.white,
    fontSize: 16.0
  );
}

ShowSnackbar(BuildContext context, String content, Color backgroundColor){
  SnackBar snackBar = SnackBar(
    content: Text(content),
    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
