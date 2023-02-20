// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  static HttpLink httpLink = HttpLink(dotenv.env['PRODUCT_API'].toString());

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
