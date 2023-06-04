import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = 'edufin9.db';
  static final _databaseVersion = 3;

  // Card table
  static final table = 'cards';
  static final columnCardId = 'card_id';
  static final columnMaskedCard = 'masked_card';
  static final columnExpiry = 'expiry';
  static final columnStatus = 'status';


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
        $columnExpiry TEXT,
        $columnStatus TEXT
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

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryRowsByCardId(String cardId) async {
    Database db = await instance.database;
    return await db.query(
      table,
      where: '$columnCardId = ?',
      whereArgs: [cardId],
    );
  }
}
