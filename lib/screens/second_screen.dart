// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_application/screens/third_screen.dart';
import 'package:practice_application/shared_preference_manager.dart/custom_operations.dart';
import 'package:practice_application/shared_preference_manager.dart/shared_preference_operations.dart';
import 'package:practice_application/utils/widgets/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  static const String routeName = '/secondscreen';
  TextEditingController keyController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  var translation = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(translation!.secondscreen),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextfieldWidget(controller: keyController, hintText: 'Enter key'),
              const SizedBox(
                height: 10,
              ),
              TextfieldWidget(controller: valueController, hintText: 'Enter value'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (() async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        SharedPreferenceOperations().setInt(
                            prefs,
                            keyController.text,
                            int.parse(valueController.text));
                      }),
                      child: const Text("setInt")),
                  ElevatedButton(
                      onPressed: (() async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        SharedPreferenceOperations().setString(
                            prefs, keyController.text, valueController.text);
                      }),
                      child: const Text("setString")),
                  ElevatedButton(
                      onPressed: (() async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        SharedPreferenceOperations().setDouble(
                            prefs,
                            keyController.text,
                            double.parse(valueController.text));
                      }),
                      child: const Text("setDouble")),
                  ElevatedButton(
                      onPressed: (() async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        SharedPreferenceOperations().setBool(
                            prefs,
                            keyController.text,
                            valueController.text.isBool);
                      }),
                      child: const Text("setBool")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (() async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        CustomOperations()
                            .setCustomMap(prefs, keyController.text, {"input": valueController.text});
                      }),
                      child: const Text("setCustomMap")),
                  ElevatedButton(
                      onPressed: (() async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        CustomOperations()
                            .setCustomList(prefs, keyController.text, [valueController.text]);
                      }),
                      child: const Text("setCustomList")),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(ThirdScreen.routeName);
                  },
                  child: Text("${translation.navigate} ${translation.thirdscreen}"))
            ],
          ),
        ),
      ),
    );
  }
}
