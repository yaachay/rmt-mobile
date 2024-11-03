// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// ignore: non_constant_identifier_names
Future<Database> OpenDatabaseFromAssets() async {
  // Get the path to the database directory
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, "database.db");

  // Check if the database already exists
  if (!await File(path).exists()) {
    // If not, copy the database from assets to the local path
    ByteData data = await rootBundle.load("assets/databases/database.db");
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write the bytes to the local file
    await File(path).writeAsBytes(bytes, flush: true);
  }

  // Open the database
  return await openDatabase(path);
}
