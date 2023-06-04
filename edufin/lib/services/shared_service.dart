import 'dart:developer';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:edufin/models/auth/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  
  static Future<bool> isLoggedIn() async {
    var isCacheKeyExist = await APICacheManager().isAPICacheKeyExist("login_details");

    return isCacheKeyExist;
  }

  static Future<LoginResponseModel?> loginDetails() async {
    var isCacheKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");

    if (isCacheKeyExist) {
      var cacheData = await APICacheManager().getCacheData("login_details");

      return loginResponseJson(cacheData.syncData);
    }
    return null;
  }

  static Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    return;
  }

  static Future<String?> getToken() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if(token == null) {
      return null;
    }

    return token;
  }

  static Future<void> setUserInfo(Map<String, dynamic> userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   
    prefs.setString("email", userInfo['email']);
    prefs.setString("fullName", userInfo['fullName']);
    prefs.setString("phoneNumber", userInfo['phoneNumber']);
    prefs.setString("governmentId", userInfo['governmentId']);
    prefs.setString("accountType", userInfo['accountType']);

    return;
  }


}
