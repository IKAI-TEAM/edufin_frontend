import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = 'edufin10.db';
  static final _databaseVersion = 3;

  // Card table
  static final table = 'cards';
  static final columnCardId = 'card_id';
  static final columnMaskedCard = 'masked_card';
  static final columnExpiryMonth= 'expiry_month';
  static final columnExpiryYear = 'expiry_year';
  static final columnStatus = 'status';

  // History table
  static final tableHistory = 'transaction_histories';
  static final columnTransactionId = 'transaction_id';
  static final columnAmount = 'amount';
  static final columnMerchantName= 'merchant_name';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    log("created");
    await db.execute('''
      CREATE TABLE $table (
        $columnCardId TEXT PRIMARY KEY,
        $columnMaskedCard TEXT,
        $columnExpiryMonth INTEGER, 
        $columnExpiryYear INTEGER,
        $columnStatus TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableHistory (
        $columnTransactionId TEXT PRIMARY KEY,
        $columnCardId TEXT,
        $columnAmount INTEGER,
        $columnMerchantName TEXT
      )
    ''');
  }

  void onUpgrade(Database db, int oldVersion, int newVersion) {
    log("upgrade");
    if (oldVersion < 2) {
      // Perform migration to add the 'status' column
      db.execute('ALTER TABLE cards ADD COLUMN status TEXT');
    }
  }

  Future<void> rebuildCard() async {
    Database db = await instance.database;

    // Delete the existing cards table
    await db.execute('DROP TABLE IF EXISTS $table');
    
    // Create a new cards table
    await db.execute('''
      CREATE TABLE $table (
        $columnCardId TEXT PRIMARY KEY,
        $columnMaskedCard INTEGER,
        $columnExpiryMonth INTEGER, 
        $columnExpiryYear INTEGER,
        $columnStatus TEXT
      )
    ''');
  }

  Future<void> rebuildHistory() async {
    Database db = await instance.database;

    // Delete the existing cards table
    await db.execute('DROP TABLE IF EXISTS $table');
    
    // Create a new histories table
    await db.execute('''
      CREATE TABLE $tableHistory (
        $columnTransactionId TEXT PRIMARY KEY,
        $columnCardId TEXT,
        $columnAmount INTEGER,
        $columnMerchantName TEXT
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;

    List<Map<String, Object?>> queryInCards = await db.query(table);
    log(queryInCards.toString());

    return queryInCards;
  }

  Future<List<Map<String, dynamic>>> queryRowsByCardId(String cardId) async {
    Database db = await instance.database;
    return await db.query(
      table,
      where: '$columnCardId = ?',
      whereArgs: [cardId],
    );
  }

  // Transaction
  Future<int> insertHistory(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableHistory, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRowsHistories() async {
    Database db = await instance.database;
    return await db.query(tableHistory);
  }

  Future<List<Map<String, dynamic>>> queryRowsByTransactionId(String transactionId) async {
    Database db = await instance.database;
    return await db.query(
      tableHistory,
      where: '$columnTransactionId = ?',
      whereArgs: [transactionId],
    );
  }

}
