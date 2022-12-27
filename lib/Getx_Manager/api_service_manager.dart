// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:practice_application/Getx_Manager/getx_network_manager.dart';
import 'package:practice_application/GraphQl/modals/all_products_model.dart';
import 'package:practice_application/GraphQl/services.dart';
import 'package:practice_application/utils/constants/app_constants.dart';

class ApiServiceManager extends GetxController {
  List<AllProductData> allProductList = [];
  bool isLoading = false;

  void stopLoading() {
    isLoading = false;
    update();
  }

  Future<bool> getAllProductsData(BuildContext context) async {
    isLoading = true;
    update();
    QueryResult result = await ApiService().fetchAllProductData(context);
    if (result.hasException == false) {
      try {
        if (result.data != null) {
          allProductList =
              AllProductsModel.fromJson(result.data!['products']).edges!;
          update();
        }
        return false;
      } catch (error) {
        isLoading = false;
        update();
        return true;
      }
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        isLoading = false;
        update();
      });
      return true;
    }
  }
}





// GraphQLClient client = GraphQlConfig().clientToQuery();
    // QueryResult result = await client.query(
    //   QueryOptions(
    //     document: gql(allProductsQuery),
    //     fetchPolicy: FetchPolicy.noCache,
    //   ),
    // );
    // //return result;
    // if (result.hasException == true) {
    //   isLoading = false;
    //   GetXNetworkManager().connectionType != AppConstants.noInternet
    //       ? ShowError404Dialog(context, () {})
    //       : const SizedBox();
    //   update();
    // } else if (result.data != null) {
    //   try {
    //     isLoading = true;
    //     allProductList =
    //         AllProductsModel.fromJson(result.data!['products']).edges!;
    //     update();
    //   } catch (e) {
    //     isLoading = false;
    //     update();
    //     ShowErrorDialog(context, () {});
    //   }
    // }
    //return allProductList;