// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_application/Getx_Manager/getx_network_manager.dart';
import 'package:practice_application/GraphQl/modals/all_products_model.dart';
import 'package:practice_application/utils/helpers.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});
  static const String routeName = "/detailsscreen";
  final GetXNetworkManager _getXNetworkManager = GetXNetworkManager();
  final Helpers _helpers = Helpers();
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
