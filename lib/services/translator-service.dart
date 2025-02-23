// ignore_for_file: file_names

import 'dart:io';
import './services.dart';

class TranslatorService {
  static Future<String> rkToMY(String output) async {
    List<Map<String, String>> rules = [];
    List<Map<String, dynamic>> results = (Platform.isAndroid || Platform.isIOS)
        ? await DatabaseService.readKnowledges4Mobile()
        : await DatabaseService.readKnowledges4Desktop();
    for (var result in results) {
      rules.add({
        'from': result['rakhine'].toString(),
        'to': result['myanmar'].toString(),
      });
    }

    return TranslatorService.replaceWithRule(rules, output);
  }

  static Future<String> myToRK(String output) async {
    List<Map<String, String>> rules = [];
    List<Map<String, dynamic>> results = (Platform.isAndroid || Platform.isIOS)
        ? await DatabaseService.readKnowledges4Mobile()
        : await DatabaseService.readKnowledges4Desktop();
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
}
