// ignore_for_file: implementation_imports

import 'package:http/http.dart';
import 'package:practice_application/features/sign_up/data/data_source/register_data_source.dart';
import 'package:practice_application/features/sign_up/domain/repositories/repository_domain.dart';

class RegisterRepository implements RepositoryDomain{
  @override
  Future<Response> getRegisterRepo(Map body) async {
    return getRegisterDataSource(body);
  }
}