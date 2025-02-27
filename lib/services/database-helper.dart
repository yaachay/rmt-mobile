import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:rakhine_myanmar_translator/models/models.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._();
  static DatabaseHelper get instance {
    if (_instance == null) {
      _instance = DatabaseHelper._();
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        sqfliteFfiInit();
        databaseFactory = databaseFactoryFfi;
      }
    }
    return _instance!;
  }

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE records (recordId INTEGER PRIMARY KEY, originalText TEXT, translatedText TEXT, fromLang TEXT, toLang TEXT)');
      },
    );
  }

  Future<int> insertRecord(Record record) async {
    try {
      final db = await database;
      return await db!.insert('records', record.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print('Error inserting record: $e');
      return -1;
    }
  }

  Future<List<Record>> getRecords() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('records');
    return maps.map((map) => Record.fromMap(map)).toList();
  }

  Future<int> updateRecord(Record record) async {
    final db = await database;
    return await db!.update('records', record.toMap(),
        where: 'recordId = ?', whereArgs: [record.recordId]);
  }

  Future<int> deleteRecord(int recordId) async {
    final db = await database;
    return await db!
        .delete('records', where: 'recordId = ?', whereArgs: [recordId]);
  }
}
