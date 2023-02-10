import 'package:dartz/dartz.dart';
import 'package:practice_application/core/failure.dart';
import '../../data/models/response200_model.dart';

abstract class RegisterRepositoryDomain {

  Future<Either<Response200Model, Failure>> getRegisterRepo(Map body);
  
}
