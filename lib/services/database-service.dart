// ignore_for_file: file_names, non_constant_identifier_names
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseService {
  // Open database for mobile (Android & iOS)
  static Future<List<Map<String, dynamic>>> readKnowledges4Mobile() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "database.db");

    // Check if the database already exists
    if (!await File(path).exists()) {
      // Copy the database from assets
      ByteData data = await rootBundle.load("assets/databases/database.db");
      List<int> bytes = data.buffer.asUint8List();

      // Ensure the directory exists before writing the file
      await File(path).writeAsBytes(bytes, flush: true);
    }

    Database db = await openDatabase(path);
    return await db.rawQuery("SELECT * FROM knowledgebase");
  }

  // Open database for desktop (Windows, macOS, Linux)
  static Future<List<Map<String, dynamic>>> readKnowledges4Desktop() async {
    sqfliteFfiInit(); // Initialize SQLite for Desktop
    databaseFactory = databaseFactoryFfi; // Use FFI database

    Directory documentsDir = await getApplicationDocumentsDirectory();
    String dbFolderPath = join(documentsDir.path, "databases");
    String dbPath = join(dbFolderPath, "database.db");

    // Ensure the database directory exists
    if (!await Directory(dbFolderPath).exists()) {
      await Directory(dbFolderPath).create(recursive: true);
    }

    // If the database doesn't exist, copy it from assets
    if (!await File(dbPath).exists()) {
      ByteData data = await rootBundle.load("assets/databases/database.db");
      List<int> bytes = data.buffer.asUint8List();
      await File(dbPath).writeAsBytes(bytes, flush: true);
    }

    Database db = await databaseFactoryFfi.openDatabase(dbPath);
    return await db.query('knowledgebase');
  }
}
