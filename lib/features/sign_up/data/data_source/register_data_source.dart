// ignore_for_file: avoid_print
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' ;

Future<Response> getRegisterDataSource(Map body) async {
  String url = dotenv.env['SIGNUP_API'].toString();
  Uri uri = Uri.parse(url);
  var bodyy = {"email": "aa.byteridge@gmail.com", "password": "Byteridge"};
  Response response = await post(uri, body: bodyy);
  return response;
}
