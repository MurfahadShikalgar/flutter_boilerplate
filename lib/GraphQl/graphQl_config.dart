// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:practice_application/utils/constants/app_constants.dart';

class GraphQlConfig {
  static HttpLink httpLink = HttpLink(AppConstants.productsApi);

  ValueNotifier<GraphQLClient> client =
      ValueNotifier(
        GraphQLClient(
          cache: GraphQLCache(), 
          link: httpLink
        )
  );

  GraphQLClient clientToQuery() {
    //print('token: $token');
    return GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );
  }

}
