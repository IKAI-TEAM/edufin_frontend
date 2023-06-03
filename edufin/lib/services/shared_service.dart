import 'dart:developer';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:edufin/models/auth/login_response_model.dart';

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

    APICacheDBModel cacheModel = APICacheDBModel(key: "token", syncData: token);

    log(token.toString());

    await APICacheManager().addCacheData(cacheModel);
  }

  static Future<String?> getToken() async {
    var isCacheKeyExist = await APICacheManager().isAPICacheKeyExist("token");

    if (isCacheKeyExist) {
      var cacheData = await APICacheManager().getCacheData("token");

      return cacheData.syncData;
    }

    return null;
  }
}
