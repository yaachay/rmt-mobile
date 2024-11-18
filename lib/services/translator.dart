// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';

class Translator {
  static Future<String> translateRK2MY(String output) async {
    WidgetsFlutterBinding.ensureInitialized();
    List<Map<String, String>> rules = [];
    List<Map<String, dynamic>> results = DotEnv.knowledges;
    for (var result in results) {
      rules.add({
        'from': result['rakhine'].toString(),
        'to': result['myanmar'].toString(),
      });
    }

    return Translator.replaceWithRule(rules, output);
  }

  static Future<String> translateMY2RK(String output) async {
    WidgetsFlutterBinding.ensureInitialized();
    List<Map<String, String>> rules = [];
    List<Map<String, dynamic>> results = DotEnv.knowledges;
    for (var result in results) {
      rules.add({
        'from': result['myanmar'].toString(),
        'to': result['rakhine'].toString(),
      });
    }
    return Translator.replaceWithRule(rules, output);
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
