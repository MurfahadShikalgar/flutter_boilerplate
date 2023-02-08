// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, unused_local_variable, unnecessary_new

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:practice_application/features/sign_up/data/repositories/register_repositories.dart';
import 'package:practice_application/utils/widgets/custom_toast.dart';

Future<Response> RegisterUser(Map body) async {
  Response response = await RegisterRepository().getRegisterRepo(body);
  if (response.statusCode == 200) {
    print("response 200: 200");
    var decodedData = jsonDecode(response.body);
    ShowCustomToast("Registered Successfully", Colors.green);
    return response;
  } else if (response.statusCode == 400) {
    print("response 400: 400");
    var decodedData = jsonDecode(response.body);
    ShowCustomToast(decodedData['error']['message'].toString(), Colors.red);
    return response;
  } else {
    print("response unexpected: unexpected}");
    var decodedData = jsonDecode(response.body);
    ShowCustomToast(response.statusCode.toString(), Colors.yellow);
    return response;
  }
}
