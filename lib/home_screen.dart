// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_application/getX_state_manager.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GetxStateManager controller = Get.put(GetxStateManager());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/second', arguments: {"title": "Second Screen"});
                },
                child: Text("Navigate to screen 2")),
            Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
                  controller.count.value.toString(),
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
          ],
        ),
      ),
    );
  }
}
