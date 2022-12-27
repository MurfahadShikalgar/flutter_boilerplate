// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:practice_application/utils/constants/app_constants.dart';
import 'package:practice_application/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

ShowErrorDialog(BuildContext context, Function onRetry) {
  Helpers _helper = Helpers();
  var translation = AppLocalizations.of(context);
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.cancel,
                    size: 60,
                  ),
                  Text(
                    translation!.error,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    translation.errorDesc,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
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
                ],
              ),
            ),
          ),
        );
      });
}
