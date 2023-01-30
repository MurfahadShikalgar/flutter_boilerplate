// ignore_for_file: avoid_print
import 'package:http/http.dart' ;

Future<Response> getRegisterDataSource(Map body) async {
  String url =
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA5ISVU8sV3nnQYdnzkfcS0UspQFhvMQfk";
  Uri uri = Uri.parse(url);
  var bodyy = {"email": "aa.byteridge@gmail.com", "password": "Byteridge"};
  Response response = await post(uri, body: bodyy);
  return response;
}
