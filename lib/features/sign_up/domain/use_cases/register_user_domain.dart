// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, unused_local_variable, unnecessary_new
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:practice_application/core/failure.dart';
import 'package:practice_application/features/sign_up/data/models/response200_model.dart';
import 'package:practice_application/features/sign_up/data/repositories/register_repositories.dart';
import 'package:practice_application/utils/widgets/custom_toast.dart';

class RegisterUser {
  final RegisterRepository registerRepository;

  RegisterUser(this.registerRepository);
  
  getUserRegister(Map body) async {
    var response = await registerRepository.getRegisterRepo(body);
    if (response.isLeft()) {
      ShowCustomToast("response 200", Colors.green);
      return Left(response as Response200Model);
    } else if (response.isRight()) {
      ShowCustomToast("response Failure", Colors.red);
      return Right(ServerFailure(""));
    } else {
      ShowCustomToast("unexpected", Colors.blue);
      return Right(ConnectionFailure());
    }
  }
}

// Future<Response> RegisterUser(Map body) async {
//   Response response = await RegisterRepository().getRegisterRepo(body);
//   if (response.statusCode == 200) {
//     print("response 200: 200");
//     var decodedData = jsonDecode(response.body);
//     ShowCustomToast("Registered Successfully", Colors.green);
//     return response;
//   } else if (response.statusCode == 400) {
//     print("response 400: 400");
//     var decodedData = jsonDecode(response.body);
//     ShowCustomToast(decodedData['error']['message'].toString(), Colors.red);
//     return response;
//   } else {
//     print("response unexpected: unexpected}");
//     var decodedData = jsonDecode(response.body);
//     ShowCustomToast(response.statusCode.toString(), Colors.yellow);
//     return response;
//   }
// }
