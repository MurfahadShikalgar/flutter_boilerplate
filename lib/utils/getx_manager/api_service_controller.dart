// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../network/graphql/api_services.dart';
import '../network/graphql/modals/all_products_model.dart';

class ApiServiceManager extends GetxController {
  List<AllProductData> allProductList = [];
  bool isLoading = false;

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
      print(result.exception);
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