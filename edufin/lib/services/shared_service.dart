import 'dart:developer';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:edufin/config/database.dart';
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

  
  static Future<void> saveCardsInfo(List<dynamic> cardList) async {
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    
    await databaseHelper.rebuildCard();

    for (var cardData in cardList) {
      String cardId = cardData['card_id'];
      int maskedCard = cardData['masked_card'];
      int expiryMonth = cardData['expiry_month'];
      int expiryYear = cardData['expiry_year'];
      String status = cardData['status'];

      // Check if the card already exists in the database
      List<Map<String, dynamic>> existingCards = await databaseHelper.queryRowsByCardId(cardId);
      if (existingCards.isEmpty) {
        // Card doesn't exist, insert it into the database
        Map<String, dynamic> cardMap = {
          DatabaseHelper.columnCardId: cardId,
          DatabaseHelper.columnMaskedCard: maskedCard,
          DatabaseHelper.columnExpiryMonth: expiryMonth,
          DatabaseHelper.columnExpiryYear: expiryYear,
          DatabaseHelper.columnStatus: status,
        };

        await databaseHelper.insert(cardMap);
        log("Inserted");
      }
    }
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

  static Future<Map<String, dynamic>> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> userInfo = {
      'email': prefs.getString("email") ?? '',
      'fullName': prefs.getString("fullName") ?? '',
      'phoneNumber': prefs.getString("phoneNumber") ?? '',
      'governmentId': prefs.getString("governmentId") ?? '',
      'accountType': prefs.getString("accountType") ?? '',
    };

    return userInfo;
  }



}
