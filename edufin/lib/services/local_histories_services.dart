import 'package:edufin/config/database.dart';

class localHistoriesServices {
  static Future<List<Map<String, dynamic>>> getHistoryList() async {
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    return await databaseHelper.queryAllRowsHistories();
  }
}
