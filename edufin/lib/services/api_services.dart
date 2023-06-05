import 'dart:convert';
import 'dart:developer';

import 'package:edufin/config/config.dart';
import 'package:edufin/models/auth/login_request_model.dart';
import 'package:edufin/models/auth/register_request_model.dart';
import 'package:edufin/services/shared_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

      log(response.body.toString());
      
      if (response.statusCode != 200) {
        return {'success': false, 'error': 'Server error'};
      }

      if(responseBody['error'] != null) {
        return {'success': false, 'error': responseBody['error']};
      }

      String? bearerToken = response.headers['authorization'];

      if (bearerToken != null && bearerToken.startsWith('Bearer ')) {
        String? token = bearerToken.substring(7); // Remove 'Bearer ' prefix
        await SharedService.setToken(token);

        log(responseBody['userData'].toString());

        await SharedService.setUserInfo(responseBody['userData']);

        await SharedService.saveCardsInfo(responseBody['card']);
        
      }

      return {'success': true };
    

      
    } catch (e, stackTrace) {
      log('Error: ${e.toString()}');
      log('StackTrace: ${stackTrace.toString()}');

      // Get line number and file name from stackTrace
      final lines = stackTrace.toString().split('\n');
      if (lines.length > 0) {
        final lineInfo = lines[0];
        log('Line Info: $lineInfo');
      }
      
      
      log(e.toString());
			return {'success': false, 'error': 'Failed to connect to the server'};
    
		}
  }

  // Get user history
  static Future<bool> getUserHistory() async {
    var url = Uri.http(
      Config.apiURL,
      Config.historyAPI,
    );

    // Token
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenHistory = prefs.getString('token').toString();
    
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'x-access-token': tokenHistory
    };

    try {
      final response = await http.post(url, headers: headers);
      final responseBody = jsonDecode(response.body);

      await SharedService.saveHistoryInfo(responseBody['history']);
    } catch (e, stackTrace) {
      log(stackTrace.toString());
      log(e.toString());
      
    }

    return true;
  }

    

}
