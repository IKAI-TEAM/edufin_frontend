import 'dart:convert';

import 'package:edufin/config/config.dart';
import 'package:edufin/models/auth/login_request_model.dart';
import 'package:edufin/models/auth/login_response_model.dart';
import 'package:edufin/models/auth/otp_validation_request_model.dart';
import 'package:edufin/services/shared_service.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.loginAPI,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 201) {
      SharedService.setToken(loginResponseJson(response.body));

      return true;
    } else {
      return false;
    }
  }

  static Future<dynamic> otp(OtpValidationRequestModel model) async {
    var token = await SharedService.getToken();

    if (token == null) {
      return false;
    }

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'X-Access-Token': token
    };

    var url = Uri.http(
      Config.apiURL,
      Config.otpAPI,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 201) {
      var decoded = json.decode(response.body);

      if (decoded['oldUser'] == true) {
        return 1;
      }
      return 2;
    } else {
      return 3;
    }
  }
}
