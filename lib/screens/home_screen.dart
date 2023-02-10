// ignore_for_file: prefer_const_constructors, deprecated_member_use, must_be_immutable, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:practice_application/getx_manager/theme_controller.dart';
import 'package:practice_application/screens/second_screen.dart';
import 'package:practice_application/utils/helpers.dart';
import 'package:practice_application/utils/network/network_connectivity.dart';
import 'package:practice_application/utils/widgets/dialog_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "/homescreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GetxStateManager controller = Get.put(GetxStateManager());
  final NetworkConnectivityController _connectivityController = Get.put(NetworkConnectivityController());
  final Helpers _helpers = Helpers();

  @override
  Widget build(BuildContext context) {
    var translation = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(translation!.homescreen),
        actions: [
          GetBuilder<GetxStateManager>(
            builder: (_) => Switch(
                value: controller.themeStatus,
                onChanged: ((state) {
                  controller.changeTheme(state);
                })),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<NetworkConnectivityController>(
            builder: (_) {
              return _connectivityController.connectionType == "No Internet"
                  ? Container(
                      width: _helpers.getWidth(context),
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          _connectivityController.connectionType,
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
              child:
                  Text("${translation.navigate} ${translation.secondscreen}")),
          const SizedBox(
            height: 30,
          ),
          Text(
            translation.resultTitle,
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
    );
  }
}
