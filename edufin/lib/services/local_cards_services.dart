import 'package:edufin/config/database.dart';

class localCardsServices {
  static Future<List<Map<String, dynamic>>> getCardList() async {
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    return await databaseHelper.queryAllRows();
  }
}
