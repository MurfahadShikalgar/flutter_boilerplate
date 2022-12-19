// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:practice_application/utils/constants/app_constants.dart';

import '../helpers.dart';

ShowNoInternetDialog(BuildContext context) {
  Helpers helper = Helpers();
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
                    Icons.wifi_off_outlined,
                    size: 60,
                  ),
                  const Text(
                    AppConstants.noInternet,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    AppConstants.noInternetDesc,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    width: helper.getWidth(context) * 0.7,
                    color: Colors.blue,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        AppConstants.OK,
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      )),
                ],
              ),
            ),
          ),
        );
      });
}
