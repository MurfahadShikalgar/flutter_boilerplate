import 'package:dartz/dartz.dart';
import 'package:practice_application/core/failure.dart';
import '../../data/models/register_model.dart';

abstract class RegisterRepositoryDomain {

  Future<Either<RegisterModel, Failure>> getRegisterRepo(Map body);
  
}
