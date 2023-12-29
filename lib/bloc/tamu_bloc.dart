import 'dart:convert';

import 'package:tamuapp/helpers/api.dart';
import 'package:tamuapp/helpers/api_url.dart';
import 'package:tamuapp/model/tamu.dart';

class TamuBloc {
  static Future<List<Tamu>> getTamus() async {
    String apiUrl = ApiUrl.listTamu;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> listTamu = (jsonObj as Map<String, dynamic>)['data'];
    List<Tamu> tamus = [];
    for (int i = 0; i < listTamu.length; i++) {
      tamus.add(Tamu.fromobj(listTamu[i]));
    }
    return tamus;
  }

  static Future addTamu({required Tamu tamu}) async {
    String apiUrl = ApiUrl.createTamu;

    var body = {
      "nama": tamu.nama,
      "jam": tamu.jam,
      "alamat": tamu.alamat,
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> updateTamu({required Tamu tamu}) async {
    String apiUrl = ApiUrl.updateTamu(tamu.id);

    var body = {
      "posisi": tamu.nama,
      "skill": tamu.jam,
      "jobdesc": tamu.alamat,
    };
    print("Body : $body");
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body.toString());
    return jsonObj['data'];
  }

  static Future<bool> deleteTamu({required int id}) async {
    String apiUrl = ApiUrl.deleteTamu(id);

    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['data'];
  }
}
