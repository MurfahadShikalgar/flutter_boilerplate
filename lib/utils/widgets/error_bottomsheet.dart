// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:practice_application/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants/app_constants.dart';

ShowErrorBottomSheet(BuildContext context, Function onRetry) {
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
              Icons.cancel,
              size: 70,
            ),
            Text(
              translation!.error,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              translation.errorDesc,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    // onPressed: () async {
                    //   // await _apiController
                    //   //     .getAllProductsData(context)
                    //   //     .whenComplete(() => Navigator.pop(context));
                    // },
                    onPressed: () => onRetry(),
                    child: Text(
                      translation.retry,
                      style: const TextStyle(color: Colors.blue, fontSize: 16),
                    )),
                Container(
                  height: _helper.getHeight(context) * 0.03,
                  width: 1,
                  color: Colors.blueAccent,
                ),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      translation.close,
                      style: const TextStyle(color: Colors.blue, fontSize: 16),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        );
      });
}
