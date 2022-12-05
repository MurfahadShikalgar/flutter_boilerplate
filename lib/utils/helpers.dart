import 'package:flutter/cupertino.dart';

class Helpers {
  double getHeight(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  double getWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }
}
