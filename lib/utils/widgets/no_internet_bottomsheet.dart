// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:practice_application/utils/helpers.dart';
import '../constants/app_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

ShowNoInternetBottomSheet(BuildContext context, Function onPressed) {
  final Helpers _helper = Helpers();
  var translation = AppLocalizations.of(context);
  return showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: false,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.wifi_off_outlined,
              size: 60,
            ),
            Text(
              translation!.noInternet,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              translation.noInternetDesc,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              width: _helper.getWidth(context) * 0.7,
              color: Colors.blue,
            ),
            TextButton(
                onPressed: (() => onPressed()),
                child: Text(
                  translation.ok,
                  style: const TextStyle(color: Colors.blue, fontSize: 16),
                )),
            const SizedBox(
              height: 10,
            )
          ],
        );
      });
}
