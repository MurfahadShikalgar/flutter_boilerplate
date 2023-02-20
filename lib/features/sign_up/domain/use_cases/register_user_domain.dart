// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, unused_local_variable, unnecessary_new, unnecessary_null_comparison
import 'package:dartz/dartz.dart';
import 'package:practice_application/core/failure.dart';
import 'package:practice_application/core/use_case.dart';
import 'package:practice_application/features/sign_up/data/models/register_model.dart';
import 'package:practice_application/features/sign_up/data/repositories/register_repositories.dart';

// class RegisterUser {
//   final RegisterRepository registerRepository;

//   RegisterUser({required this.registerRepository});

//   Future<Either<RegisterModel, Failure>> getUserRegister(Map body) async {
//     var response = await registerRepository.getRegisterRepo(body);
//     if (response.isLeft()) {
//       ShowCustomToast("response 200", Colors.green);
//       return Left(response as RegisterModel);
//     } else if (response.isRight()) {
//       ShowCustomToast("response Failure", Colors.red);
//       return Right(ServerFailure(""));
//     } else {
//       ShowCustomToast("unexpected", Colors.blue);
//       return Right(ConnectionFailure());
//     }
//   }
// }

class RegisterUserrr implements Usecase<RegisterModel> {
  final RegisterRepository registerRepository;

  RegisterUserrr({required this.registerRepository}) : assert(registerRepository != null);

  @override
  Future cal(Map body) async {
    Either<RegisterModel, Failure> hb = await registerRepository.getRegisterRepo(body);
    return hb;
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
