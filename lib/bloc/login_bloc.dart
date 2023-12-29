import 'dart:convert';

import 'package:tamuapp/helpers/api.dart';
import 'package:tamuapp/helpers/api_url.dart';
import 'package:tamuapp/model/login.dart';

class LoginBloc {
  static Future<Login> login(
      {required String email, required String password}) async {
    String apiUrl = ApiUrl.login;
    var body = {"email": email, "password": password};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body.toString());
    return Login.fromJson(jsonObj);
  }
}
