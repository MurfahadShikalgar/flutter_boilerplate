// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:practice_application/utils/constants/styles_constant.dart';
import 'package:practice_application/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:practice_application/utils/widgets/custom_button.dart';

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
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              width: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2.5)),
                  color: Colors.black12),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              translation!.error,
              textAlign: TextAlign.center,
              style: Styles.errorTitleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                translation.errorDesc,
                textAlign: TextAlign.center,
                style: Styles.errorDescStyle,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    height: _helper.getHeight(context) * 0.05,
                    width: _helper.getWidth(context) * 0.25,
                    color: Color.fromARGB(255, 16, 181, 181),
                    text: translation.retry,
                    onTap: onRetry),
                // TextButton(
                //     // onPressed: () async {
                //     //   // await _apiController
                //     //   //     .getAllProductsData(context)
                //     //   //     .whenComplete(() => Navigator.pop(context));
                //     // },
                //     onPressed: () => onRetry(),
                //     child: Text(
                //       translation.retry,
                //       style: const TextStyle(color: Colors.blue, fontSize: 16),
                //     )),
                const SizedBox(
                  width: 40,
                ),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      translation.close,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 16, 181, 181),
                          fontSize: 16),
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
