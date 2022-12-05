import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

  showFlutterToast(String content, Color backgroundColor){
    return Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0
  );
}