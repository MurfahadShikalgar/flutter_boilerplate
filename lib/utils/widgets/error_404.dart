// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:practice_application/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


ShowError404Dialog(BuildContext context, Function onReload) {
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
                    translation!.error404,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    translation.error404Desc,
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
                      // onPressed: () async {
                      //   //await _apiController.getAllProductsData(context);
                      //   Navigator.pop(context);
                      // },
                      onPressed: onReload(),
                      child: Text(
                        translation.reload,
                        style: const TextStyle(color: Colors.blue, fontSize: 16),
                      )),
                ],
              ),
            ),
          ),
        );
      });
}
