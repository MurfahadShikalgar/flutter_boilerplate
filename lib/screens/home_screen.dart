// ignore_for_file: prefer_const_constructors, deprecated_member_use, must_be_immutable, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:practice_application/Getx_Manager/getX_state_manager.dart';
import 'package:practice_application/main.dart';
import 'package:practice_application/screens/second_screen.dart';
import 'package:practice_application/translations/language_list.dart';
import 'package:practice_application/translations/language_constants.dart';
import 'package:practice_application/utils/constants/app_constants.dart';
import 'package:practice_application/utils/helpers.dart';
import 'package:practice_application/utils/widgets/dialog_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Getx_Manager/getx_network_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "/homescreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GetxStateManager controller = Get.put(GetxStateManager());
  final GetXNetworkManager _getXNetworkManager = Get.put(GetXNetworkManager());
  final Helpers _helpers = Helpers();

  @override
  Widget build(BuildContext context) {
    var translation = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(translation!.homescreen),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          GetBuilder<GetxStateManager>(
            builder: (_) => Switch(
                value: controller.themeStatus,
                onChanged: ((state) {
                  controller.changeTheme(state);
                })),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GetBuilder<GetXNetworkManager>(
              builder: (_) {
                return _getXNetworkManager.connectionType == "No Internet"
                    ? Container(
                        width: _helpers.getWidth(context),
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            _getXNetworkManager.connectionType,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    : const Text("");
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(SecondScreen.routeName);
                },
                child: Text(
                    "${translation.navigate} ${translation.secondscreen}")),
            const SizedBox(
              height: 30,
            ),
            Text(
              AppConstants.RESULT_TITLE,
            ),
            Obx(() => Text(
                  controller.count.toString(),
                  style: TextStyle(fontSize: 25),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    controller.increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    controller.decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.horizontal_rule),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () => ShowDialogs().DialogWidget(
                    context,
                    translation.alertdialogtitle,
                    "This is content of dialog box."),
                child: Text(translation.alertdialogtitle)),
            ElevatedButton(
                onPressed: () => ShowDialogs().DefaultDialog(
                    context,
                    translation.defaultdialogtitle,
                    "Do you want default dialog success?",
                    () {}),
                child: Text(translation.defaultdialogtitle))
          ],
        ),
      ),
    );
  }
}
