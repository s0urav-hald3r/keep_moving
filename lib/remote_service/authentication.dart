import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:keep_moving/constant/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteServices {
  static var client = http.Client();

  static Future signup(String email, String name, String phone,
      String designation, String gst, String uuid) async {
    var response = await client.post(Uri.parse(Endpoints.signup), body: {
      'email': email,
      'name': name,
      'phone': phone,
      'designation': designation,
      'gst': gst,
      'uuid': uuid
    }, headers: {
      "APP-KEY": Endpoints.appKey
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return json.decode(response.body);
  }

  static Future login(String phone) async {
    var response = await client.post(Uri.parse(Endpoints.login),
        body: {'phone': phone}, headers: {"APP-KEY": Endpoints.appKey});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return json.decode(response.body);
  }

  static Future otpVerify(String phone, String otp) async {
    var response = await client.post(Uri.parse(Endpoints.otpVerify),
        body: {'phone': phone, 'otp': otp},
        headers: {"APP-KEY": Endpoints.appKey});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return json.decode(response.body);
  }

  static Future showProfile() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var response = await client.get(Uri.parse(Endpoints.showProfile), headers: {
      "APP-KEY": Endpoints.appKey,
      "Authorization": "Bearer ${_prefs.getString('token')}",
      "Content-Type": "application/json",
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return json.decode(response.body);
  }
}
