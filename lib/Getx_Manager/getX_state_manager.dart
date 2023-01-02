// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxStateManager extends GetxController {
  final count = 0.obs;
  bool themeStatus = true;
  final preferenceData = "".obs;



  void updatePreferenceData(var value) {
    preferenceData(value);
    print(preferenceData);
  }

  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }

  void changeTheme(value) {
    if (value == true) {
      themeStatus = true;
      Get.changeTheme(ThemeData.dark());
    } else {
      themeStatus = false;
      Get.changeTheme(ThemeData.light());
    }
    update();
  }
}
