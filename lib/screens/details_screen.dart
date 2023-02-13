// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_application/utils/getx_manager/theme_controller.dart';
import 'package:practice_application/utils/constants/styles_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/network/graphql/modals/all_products_model.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});
  static const String routeName = "/detailsscreen";
  final GetxStateManager controller = Get.put(GetxStateManager());
  @override
  Widget build(BuildContext context) {
    ProductData data = Get.arguments;
    var translation = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(translation!.detailscreen),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                "Title :",
                style: controller.themeStatus == false ? Styles.detailsTitleStyle : Styles.detailsTitleStyleDark,
              ),
              subtitle: Text(
                data.name.toString(),
                style: controller.themeStatus == false ? Styles.detailsDescStyle : Styles.detailsDescStyleDark,
              ),
              tileColor: Colors.black12,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                "ID :",
                style: controller.themeStatus == false ? Styles.detailsTitleStyle : Styles.detailsTitleStyleDark,
              ),
              subtitle: Text(
                data.id.toString(),
                style: controller.themeStatus == false ? Styles.detailsDescStyle : Styles.detailsDescStyleDark,
              ),
              tileColor: Colors.black12,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              isThreeLine: true,
              title: Text(
                "Description :",
                style: controller.themeStatus == false ? Styles.detailsTitleStyle : Styles.detailsTitleStyleDark,
              ),
              subtitle: Text(
                data.description.toString(),
                style: controller.themeStatus == false ? Styles.detailsDescStyle : Styles.detailsDescStyleDark,
              ),
              tileColor: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}
