import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rakhine_myanmar_translator/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  Color _primary = const Color(0xFF308AF4);
  Color get primary => _primary;
  Color _scaffold = const Color(0xFFD9D9D9);
  Color get scaffold => _scaffold;
  Color _scaffoldSecondary = const Color(0x60FFFFFF);
  Color get scaffoldSecondary => _scaffoldSecondary;
  Color _scaffoldShadow = const Color(0x10000000);
  Color get scaffoldShadow => _scaffoldShadow;

  LinearGradient _appBarGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFD9D9D9), Color(0x10000000)],
  );
  LinearGradient get appBarGradient => _appBarGradient;
  Color _text = const Color(0xFF5A5A5A);
  Color get text => _text;
  Color _hintText = const Color(0xFF969DA7);
  Color get hintText => _hintText;
  Color _icon = const Color(0xFF5A5A5A);
  Color get icon => _icon;
  LinearGradient _primaryGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF59A9F2), Color(0xFF308AF4)],
  );
  LinearGradient get primaryGradient => _primaryGradient;
  Color _buttonText = const Color(0xFFD9D9D9);
  Color get buttonText => _buttonText;

  Color _white25 = const Color(0x50FFFFFF);
  Color get white25 => _white25;
  Color _white = const Color(0xFFFFFFFF);
  Color get white => _white;
  Color _black25 = const Color(0x50000000);
  Color get black25 => _black25;
  Color _black = const Color(0xFF000000);
  Color get black => _black;

  Color _topBoxShadow = const Color(0xFFFFFFFF);
  Color get topBoxShadow => _topBoxShadow;
  Color _bottomBoxShadow = const Color(0x25000000);
  Color get bottomBoxShadow => _bottomBoxShadow;

  Color _shimmerBase = const Color(0x30000000);
  Color get shimmerBase => _shimmerBase;
  Color _shimmerHighlight = const Color(0xFF5A5A5A);
  Color get shimmerHighlight => _shimmerHighlight;

  ThemeProvider() {
    loadTheme();
  }

  Future loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeString = prefs.getString('theme');
    Themes? theme = themeString != null
        ? Themes.values.firstWhere(
            (e) => e.toString() == themeString,
            orElse: () => Themes.systemDefault,
          )
        : null;

    if (theme == Themes.lightTheme) {
      _primary = const Color(0xFF308AF4);
      _scaffold = const Color(0xFFD9D9D9);
      _scaffoldSecondary = const Color(0x60FFFFFF);
      _scaffoldShadow = const Color(0x10000000);

      _appBarGradient = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFD9D9D9), Color(0x10000000)],
      );
      _text = const Color(0xFF5A5A5A);
      _hintText = const Color(0xFF969DA7);
      _icon = const Color(0xFF5A5A5A);
      _primaryGradient = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF59A9F2), Color(0xFF308AF4)],
      );
      _buttonText = const Color(0xFFD9D9D9);

      _white25 = const Color(0x50FFFFFF);
      _white = const Color(0xFFFFFFFF);
      _black25 = const Color(0x50000000);
      _black = const Color(0xFF000000);

      _topBoxShadow = const Color(0xFFFFFFFF);
      _bottomBoxShadow = const Color(0x25000000);

      _shimmerBase = const Color(0x30000000);
      _shimmerHighlight = const Color(0xFF5A5A5A);
    } else if (theme == Themes.darkTheme) {
      _primary = const Color(0xFF308AF4);
      _scaffold = const Color(0xFF1E1E1E);
      _scaffoldSecondary = const Color(0xFF333333);
      _scaffoldShadow = const Color(0x10FFFFFF);

      _appBarGradient = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1E1E1E), Color(0x10FFFFFF)],
      );
      _text = const Color(0xFFDFDFDF);
      _hintText = const Color(0xFF969DA7);
      _icon = const Color(0xFFDFDFDF);
      _primaryGradient = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF59A9F2), Color(0xFF308AF4)],
      );
      _buttonText = const Color(0xFFD9D9D9);

      _white25 = const Color(0x50FFFFFF);
      _white = const Color(0xFFFFFFFF);
      _black25 = const Color(0x50000000);
      _black = const Color(0xFF000000);

      _topBoxShadow = const Color(0x25FFFFFF);
      _bottomBoxShadow = const Color(0xFF000000);

      _shimmerBase = const Color(0xFFFFFFFF);
      _shimmerHighlight = const Color(0xFFDFDFDF);
    } else {
      bool isLightMode =
          PlatformDispatcher.instance.platformBrightness == Brightness.light;
      if (isLightMode) {
        _primary = const Color(0xFF308AF4);
        _scaffold = const Color(0xFFD9D9D9);
        _scaffoldSecondary = const Color(0x60FFFFFF);
        _scaffoldShadow = const Color(0x10000000);

        _appBarGradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFD9D9D9), Color(0x10000000)],
        );
        _text = const Color(0xFF5A5A5A);
        _hintText = const Color(0xFF969DA7);
        _icon = const Color(0xFF5A5A5A);
        _primaryGradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF59A9F2), Color(0xFF308AF4)],
        );
        _buttonText = const Color(0xFFD9D9D9);

        _white25 = const Color(0x50FFFFFF);
        _white = const Color(0xFFFFFFFF);
        _black25 = const Color(0x50000000);
        _black = const Color(0xFF000000);

        _topBoxShadow = const Color(0xFFFFFFFF);
        _bottomBoxShadow = const Color(0x25000000);

        _shimmerBase = const Color(0x30000000);
        _shimmerHighlight = const Color(0xFF5A5A5A);
      } else {
        _primary = const Color(0xFF308AF4);
        _scaffold = const Color(0xFF1E1E1E);
        _scaffoldSecondary = const Color(0xFF333333);
        _scaffoldShadow = const Color(0x10FFFFFF);

        _appBarGradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1E1E1E), Color(0x10FFFFFF)],
        );
        _text = const Color(0xFFDFDFDF);
        _hintText = const Color(0xFF969DA7);
        _icon = const Color(0xFFDFDFDF);
        _primaryGradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF59A9F2), Color(0xFF308AF4)],
        );
        _buttonText = const Color(0xFFD9D9D9);

        _white25 = const Color(0x50FFFFFF);
        _white = const Color(0xFFFFFFFF);
        _black25 = const Color(0x50000000);
        _black = const Color(0xFF000000);

        _topBoxShadow = const Color(0x25FFFFFF);
        _bottomBoxShadow = const Color(0xFF000000);

        _shimmerBase = const Color(0xFFFFFFFF);
        _shimmerHighlight = const Color(0xFFDFDFDF);
      }
    }
    notifyListeners();
  }

  Future<void> setTheme(Themes theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme.toString());
    notifyListeners();
  }
}
