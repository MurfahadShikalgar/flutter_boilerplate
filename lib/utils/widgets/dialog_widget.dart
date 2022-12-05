// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowDialogs {
  DialogWidget(BuildContext context, String title, String content) {
    var translation = AppLocalizations.of(context);
    return Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
              onPressed: () => Get.back(), child: Text(translation!.close_text))
        ],
      ),
    );
  }

  DefaultDialog(
      BuildContext context, String title, String content, Function onConfirm) {
    var translation = AppLocalizations.of(context);
    return Get.defaultDialog(
      title: title,
      content: Text(content),
      textConfirm: translation!.yes_text,
      textCancel: translation.no_text,
      onConfirm: (() {
        Get.back(canPop: true);
        onConfirm();
        //DialogWidget(context, translation.success_text, "command successful");
      }),
      onCancel: (() => Get.back()),
    );
  }

  CustomDialog(BuildContext context, String title, String content, String buttonText, Function onConfirm) {
    var translation = AppLocalizations.of(context);
    return Get.defaultDialog(
      title: title,
      content: Text(content),
      textConfirm: buttonText,
      textCancel: translation!.no_text,
      onConfirm: (() {
        Get.back(canPop: true);
        onConfirm();
      }),
      onCancel: (() => Get.back()),
    );
  }

}
