// ignore_for_file: unused_field, unused_local_variable, unrelated_type_equality_checks, use_build_context_synchronously, avoid_print

import 'dart:async';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_application/utils/getx_manager/api_service_controller.dart';
import 'package:practice_application/utils/getx_manager/theme_controller.dart';
import 'package:practice_application/screens/details_screen.dart';
import 'package:practice_application/screens/home_screen.dart';
import 'package:practice_application/utils/constants/app_constants.dart';
import 'package:practice_application/utils/constants/styles_constant.dart';
import 'package:practice_application/utils/helpers.dart';
import 'package:practice_application/utils/network/network_connectivity.dart';
import 'package:practice_application/utils/widgets/error404_bottomsheet.dart';
import 'package:practice_application/utils/widgets/no_internet_bottomsheet.dart';

import '../main.dart';
import '../utils/translations/language_constants.dart';
import '../utils/translations/language_list.dart';

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
    if (mounted) {
      getProductData();
    }
  }

  bool checkConnectivity() {
    if (_connectivityController.connectionType == AppConstants.noInternet) {
      return false;
    } else {
      return true;
    }
  }

  void getProductData() {
    Future.delayed(const Duration(seconds: 2), () async {
      if (checkConnectivity() == false) {
        ShowNoInternetBottomSheet(context, () async {
          await _apiController.getAllProductsData(context);
          _apiController.allProductList.isNotEmpty
              ? Navigator.pop(context)
              : const SizedBox();
        });
        // ShowNoInternetDialog(context, () async {
        //   await _apiController.getAllProductsData(context);
        //   _apiController.allProductList.isNotEmpty
        //       ? Navigator.pop(context)
        //       : const SizedBox();
        // });
      } else {
        bool hasError = await _apiController.getAllProductsData(context);
        if (hasError == true) {
          ShowError404BottomSheet(context, () async {
            //Navigator.pop(context);
            await _apiController.getAllProductsData(context);
            _apiController.allProductList.isNotEmpty
                ? Navigator.pop(context)
                : const SizedBox();
          });
          //   ShowErrorDialog(context, () async {
          //     await _apiController.getAllProductsData(context);
          //     _apiController.allProductList.isNotEmpty
          //         ? Navigator.pop(context)
          //         : const SizedBox();
          //   });
        }
      }
    });
  }

  final ApiServiceManager _apiController = Get.put(ApiServiceManager());
  final NetworkConnectivityController _connectivityController = Get.put(NetworkConnectivityController());
  final GetxStateManager controller = Get.put(GetxStateManager());
  final Helpers _helpers = Helpers();

  @override
  Widget build(BuildContext context) {
    var translation = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translation!.datascreen,
          style: Styles.titleStyle,
        ),
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
          // TextButton(
          //     onPressed: (() => ShowErrorBottomSheet(context, () {
          //           Navigator.pop(context);
          //         })),
          //     child: Text(
          //       translation.error,
          //       style: const TextStyle(color: Colors.white),
          //     )),
          IconButton(
              onPressed: () => Get.toNamed(HomeScreen.routeName),
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
                                ? const CircularProgressIndicator()
                                : const SizedBox(
                                    height: 0,
                                  ),
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
