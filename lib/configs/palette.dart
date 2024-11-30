import 'package:flutter/material.dart';

class Palette {
  static const bool lightTheme = false;

  static const Color primary = Color(0xFF308AF4);
  static const Color scaffold =
      lightTheme ? Color(0xFFD9D9D9) : Color(0xFF1E1E1E);
  static const Color scaffoldSecondary =
      lightTheme ? Color(0xFFF5F7FB) : Color(0xFF333333);
  static const scaffoldShadow =
      lightTheme ? Color(0x10000000) : Color(0x10FFFFFF);

  static const LinearGradient appBarGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [scaffold, scaffoldShadow],
  );
  static const Color text = lightTheme ? Color(0xFF5A5A5A) : Color(0xFFDFDFDF);
  static const Color hintText = Color(0xFF969DA7);
  static const Color icon = lightTheme ? Color(0xFF5A5A5A) : Color(0xFFDFDFDF);
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF59A9F2), Color(0xFF308AF4)],
  );
  static const Color buttonText = Color(0xFFD9D9D9);

  static const Color white25 = Color(0x50FFFFFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black25 = Color(0x50000000);
  static const Color black = Color(0xFF000000);

  static const Color topBoxShadow =
      lightTheme ? Color(0xFFFFFFFF) : Color(0x25FFFFFF);
  static const Color bottomBoxShadow =
      lightTheme ? Color(0x25000000) : Color(0xFF000000);
  // static const Color buttonText = Color(0xFFEFEFEF);
}

// class DarkTheme {
//   static const Color primary = Color(0xFF308AF4);
//   static const Color scaffold = Color(0xFF1E1E1E);
//   static const Color scaffoldSecondary = Color(0xFF333333);
//   static const Color text = Color(0xFFDFDFDF);
//   static const Color hintText = Color(0xFF969DA7);
//   static const LinearGradient primaryGradient = LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     colors: [Color(0xFF59A9F2), Color(0xFF308AF4)],
//   );
//   static const Color buttonText = Color(0xFFD9D9D9);
//   // static const Color buttonText = Color(0xFFEFEFEF);
// }

// class LightTheme {
//   static const Color primary = Color(0xFF308AF4);
//   static const Color scaffold = Color(0xFFD9D9D9);
//   static const Color scaffoldSecondary = Color(0xFFF5F7FB);
//   static const Color text = Color(0xFF5A5A5A);
//   static const Color hintText = Color(0xFF969DA7);
//   static const LinearGradient primaryGradient = LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     colors: [Color(0xFF59A9F2), Color(0xFF308AF4)],
//   );
//   static const Color buttonText = Color(0xFFD9D9D9);
//   // static const Color buttonText = Color(0xFFEFEFEF);
// }