// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_application/GraphQl/modals/all_products_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static const String routeName = "/detailsscreen";
  @override
  Widget build(BuildContext context) {
    ProductData data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: const Text("Title :"),
              subtitle: Text(data.name.toString()),
              tileColor: Colors.black12,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text("ID :"),
              subtitle: Text(data.id.toString()),
              tileColor: Colors.black12,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              isThreeLine: true,
              title: const Text("Description :"),
              subtitle: Text(data.description.toString()),
              tileColor: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}
