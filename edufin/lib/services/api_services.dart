import 'dart:convert';
import 'dart:developer';

import 'package:edufin/config/config.dart';
import 'package:edufin/models/auth/login_request_model.dart';
import 'package:edufin/models/auth/login_response_model.dart';
import 'package:edufin/models/auth/otp_validation_request_model.dart';
import 'package:edufin/models/auth/register_request_model.dart';
import 'package:edufin/services/shared_service.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<Map<String, dynamic>> registerUser(RegisterRequestModel requestModel) async {
    var url = Uri.http(
      Config.apiURL,
      Config.registerAPI,
    );

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    final body = jsonEncode(requestModel.toJson());

    try {
      final response = await http.post(url, headers: headers, body: body);
      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {'success': true, 'message': responseBody['message']};
      }

      return {'success': false, 'error': responseBody['error']};
    } catch (e) {
      return {'success': false, 'error': 'Failed to connect to the server'};
    }
  }


	static Future<Map<String, dynamic>> loginUser(LoginRequestModel requestModel) async {
    var url = Uri.http(
      Config.apiURL,
      Config.loginAPI,
    );

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    final body = jsonEncode(requestModel.toJson());

    try {
      final response = await http.post(url, headers: headers, body: body);
      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
				
				String? bearerToken = response.headers['authorization'];
				
				if (bearerToken != null && bearerToken.startsWith('Bearer ')) {
					String token = bearerToken.substring(7); // Remove 'Bearer ' prefix
					await SharedService.setToken(token);					
				}

        return {'success': true, 'message': responseBody['message'] };
      }

      return {'success': false, 'error': responseBody['error']};

    } catch (e) {
      
			return {'success': false, 'error': 'Failed to connect to the server'};
    
		}
  }
}
