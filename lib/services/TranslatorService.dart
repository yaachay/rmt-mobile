// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import './services.dart';

class TranslatorService {
  static Future<String> rkToMY(String output) async {
    WidgetsFlutterBinding.ensureInitialized();
    List<Map<String, String>> rules = [];
    List<Map<String, dynamic>> results = await getDataFromKnowledgebase();
    for (var result in results) {
      rules.add({
        'from': result['rakhine'].toString(),
        'to': result['myanmar'].toString(),
      });
    }

    return TranslatorService.replaceWithRule(rules, output);
  }

  static Future<String> my2RK(String output) async {
    WidgetsFlutterBinding.ensureInitialized();
    List<Map<String, String>> rules = [];
    List<Map<String, dynamic>> results = await getDataFromKnowledgebase();
    for (var result in results) {
      rules.add({
        'from': result['myanmar'].toString(),
        'to': result['rakhine'].toString(),
      });
    }
    return TranslatorService.replaceWithRule(rules, output);
  }

  static String replaceWithRule(List<Map<String, String>> rules, String input) {
    for (var rule in rules) {
      input = input.replaceAllMapped(RegExp(rule["from"]!), (match1) {
        return rule["to"]!.replaceAllMapped(RegExp(r"#(\d{1})"), (match2) {
          var t = match1.group(int.parse(match2.group(1)!));
          return t ?? "";
        });
      });
    }
    return input;
  }

  static Future<List<Map<String, dynamic>>> getDataFromKnowledgebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    Database database = await OpenDatabaseFromAssets();
    List<Map<String, dynamic>> results =
        await database.rawQuery('SELECT * FROM knowledgebase');
    await database.close();
    return results;
  }
}
