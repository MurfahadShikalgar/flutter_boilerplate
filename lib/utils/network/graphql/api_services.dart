// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:practice_application/utils/network/graphql/graphql_config.dart';
import 'package:practice_application/utils/network/graphql/queries/query.dart';

class ApiService {
  Future<QueryResult<Object?>> fetchAllProductData(BuildContext context) async {
    GraphQLClient client = GraphQlConfig().clientToQuery();
    QueryResult result = await client
        .query(
      QueryOptions(
        document: gql(allProductsQuery),
        fetchPolicy: FetchPolicy.noCache,
      ),
    )
    .timeout(const Duration(seconds: 6), onTimeout: (() {
      print("Session Timeout");
      return QueryResult.unexecuted;
    }));
    return result;
  }
}




//return AllProductsModel.fromJson(result.data!['products']).edges!;
    // if (result.hasException == true) {
    //   //isLoading = false;
    //   GetXNetworkManager().connectionType != AppConstants.noInternet
    //       ? ShowError404Dialog(context, () {})
    //       : const SizedBox();
    //   //update();
    // } else if (result.data != null) {
    //   try {
    //     //isLoading = true;
    //     // allProductList =
    //     AllProductsModel.fromJson(result.data!['products']).edges!;
    //     // update();
    //   } catch (e) {
    //     // isLoading = false;
    //     // update();
    //     ShowErrorDialog(context, () {});
    //   }
    // }
    //return result;