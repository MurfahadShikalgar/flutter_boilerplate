// ignore_for_file: implementation_imports

import 'package:dartz/dartz.dart';
import 'package:practice_application/core/failure.dart';
import 'package:practice_application/features/sign_up/data/data_source/register_data_source.dart';
import 'package:practice_application/features/sign_up/domain/repositories/register_repo_domain.dart';
import '../models/register_model.dart';

class RegisterRepository implements RegisterRepositoryDomain {
  final RegisterDataSource registerDataSource;

  RegisterRepository({required this.registerDataSource});

  @override
  Future<Either<RegisterModel, Failure>> getRegisterRepo(Map body) async {
    //return getRegisterDataSource(body);
    try {
      var response = await registerDataSource.getRegisterDataSource(body);
      return Left(response);
    } on Error catch (e) {
      return Right(ServerFailure(e.toString()));
    }
  }
}
