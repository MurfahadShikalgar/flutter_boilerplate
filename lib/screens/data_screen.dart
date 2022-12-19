// ignore_for_file: unused_field, unused_local_variable, unrelated_type_equality_checks

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_application/Getx_Manager/api_service_manager.dart';
import 'package:practice_application/Getx_Manager/getx_network_manager.dart';
import 'package:practice_application/screens/details_screen.dart';
import 'package:practice_application/utils/constants/app_constants.dart';
import 'package:practice_application/utils/constants/styles_constant.dart';
import 'package:practice_application/utils/helpers.dart';
import 'package:practice_application/utils/widgets/custom_toast.dart';
import 'package:practice_application/utils/widgets/error.dart';
import 'package:practice_application/utils/widgets/error_no_Internet.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});
  static const String routeName = "/datascreen";

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    //checkConnection();
    if (mounted) {
      checkConnection();
    }
  }

  checkConnection() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_getXNetworkManager.connectionType == AppConstants.noInternet) {
        ShowNoInternetDialog(context);
      } else {
        _apiController.getAllProductsData(context);
      }
    });
  }

  final ApiServiceManager _apiController = Get.put(ApiServiceManager());
  final GetXNetworkManager _getXNetworkManager = Get.put(GetXNetworkManager());
  final Helpers _helpers = Helpers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.DATA_SCREEN,
          style: Styles.titleStyle,
        ),
        actions: [
          TextButton(
              onPressed: (() => ShowErrorDialog(context)),
              child: const Text(
                "Error",
                style: TextStyle(color: Colors.white),
              )),
          IconButton(
              //onPressed: () => Get.toNamed(HomeScreen.routeName),
              onPressed: (() =>
                  ShowSnackbar(context, "Custom Snackbar", Colors.green)),
              icon: const Icon(Icons.arrow_right_alt))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // GetBuilder<GetXNetworkManager>(
            //   builder: (_) {
            //     return _getXNetworkManager.connectionType == "No Internet"
            //         ? Container(
            //             width: _helpers.getWidth(context),
            //             color: Colors.red,
            //             child: Center(
            //               child: Text(
            //                 _getXNetworkManager.connectionType,
            //                 style: const TextStyle(color: Colors.white),
            //               ),
            //             ),
            //           )
            //         : const Text("");
            //   },
            // ),
            GetBuilder<ApiServiceManager>(
                builder: (_) => _apiController.allProductList.isEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            SizedBox(
                              height: _helpers.getHeight(context) * 0.4,
                            ),
                            _apiController.isLoading == true
                                ? const CircularProgressIndicator() : const SizedBox(height: 0,),
                                // : CustomButton(
                                //     height: _helpers.getHeight(context) * 0.06,
                                //     width: _helpers.getWidth(context) * 0.2,
                                //     color: Colors.blue,
                                //     text: "Reload",
                                //     onTap: () => _apiController
                                //         .getAllProductsData(context),
                                //   )
                          ])
                    : Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: _apiController.allProductList.length,
                            itemBuilder: ((context, index) {
                              var data =
                                  _apiController.allProductList[index].node;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  tileColor: Colors.black12,
                                  title: Text(data!.name.toString()),
                                  onTap: (() => Get.toNamed(
                                      DetailsScreen.routeName,
                                      arguments: data)),
                                  trailing: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.delete)),
                                ),
                              );
                            })),
                      ))
          ],
        ),
      ),
    );
  }
}
