import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

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
                  Get.toNamed('/third', arguments: {'title': 'Third Screen'});
                },
                child: const Text("Navigate to Third screen"))
          ],
        ),
      ),
    );
  }
}
