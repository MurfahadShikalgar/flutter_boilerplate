// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_application/controllers/theme_controller.dart';
import 'package:practice_application/screens/home_screen.dart';
import 'package:practice_application/screens/second_screen.dart';
import 'package:practice_application/utils/shared_preference/custom_operations.dart';
import 'package:practice_application/utils/widgets/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../utils/shared_preference/shared_preference_operations.dart';

class ThirdScreen extends StatelessWidget {
  ThirdScreen({super.key});

  static const String routeName = '/thirdscreen';
  TextEditingController keyController = TextEditingController();
  final GetxStateManager _getxStateManager = Get.put(GetxStateManager());

  @override
  Widget build(BuildContext context) {
  var translation = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(translation!.thirdscreen),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextfieldWidget(controller: keyController, hintText: 'Enter key'),
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
                        var value = SharedPreferenceOperations()
                            .getInt(prefs, keyController.text);
                        _getxStateManager.updatePreferenceData(value.toString());
                      }),
                      child: const Text("getInt")),
                  ElevatedButton(
                      onPressed: (() async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        var value = SharedPreferenceOperations()
                            .getString(prefs, keyController.text);
                        _getxStateManager.updatePreferenceData(value);
                      }),
                      child: const Text("getString")),
                  ElevatedButton(
                      onPressed: (() async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        var value = SharedPreferenceOperations()
                            .getDouble(prefs, keyController.text);
                        _getxStateManager.updatePreferenceData(value.toString());
                      }),
                      child: const Text("getDouble")),
                  ElevatedButton(
                      onPressed: (() async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        var value = SharedPreferenceOperations()
                            .getBool(prefs, keyController.text);
                        _getxStateManager.updatePreferenceData(value.toString());
                      }),
                      child: const Text("getBool")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (() async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        var value =
                            CustomOperations().getCustomMap(prefs, keyController.text);
                        _getxStateManager.updatePreferenceData(value.toString());
                      }),
                      child: const Text("getCustomMap")),
                  ElevatedButton(
                      onPressed: (() async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        var value =
                            CustomOperations().getCustomList(prefs, keyController.text);
                        _getxStateManager.updatePreferenceData(value.toString());
                      }),
                      child: const Text("getCustomList")),
                ],
              ),
              Obx(() => Text(
                    _getxStateManager.preferenceData.value,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  )),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offNamed(SecondScreen.routeName);
                },
                child: Text("${translation.navigate} ${translation.secondscreen}"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.offNamed(HomeScreen.routeName);
                  },
                  child: Text("${translation.navigate} ${translation.homescreen}"))
            ],
          ),
        ),
      ),
    );
  }
}
