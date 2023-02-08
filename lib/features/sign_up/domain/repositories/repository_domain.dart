import 'package:http/http.dart';

abstract class RepositoryDomain {
  Future<Response> getRegisterRepo(Map body);
}
