import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments['title']),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.offNamed('/second', arguments: {'title': 'popped to second Screen'});
                },
                child: const Text("Navigate to second screen"),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/first', arguments: {'title': 'popped to first Screen'});
                },
                child: const Text("Navigate to first screen"))
          ],
        ),
      ),
    );
  }
}