import 'package:flutter/services.dart';

class ClipboardService {
  static void copy(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  static Future<String?> paste() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    return data?.text!;
  }

  static Future<bool> haveData() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    return (data != null && data.text != null && data.text!.isNotEmpty)
        ? true
        : false;
  }
}
