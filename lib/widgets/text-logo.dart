import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rakhine_myanmar_translator/configs/configs.dart';

class TextLogo extends StatefulWidget {
  final String? text;
  final int? coloredIndex;
  final double? logoSize;
  final bool? boldColoredText;
  final bool? boldAll;
  final Color? textColor;

  const TextLogo(
      {super.key,
      this.text,
      this.coloredIndex = 2,
      this.logoSize = 20,
      this.boldColoredText = true,
      this.boldAll = false,
      this.textColor});

  @override
  State<TextLogo> createState() => _TextLogoState();
}

class _TextLogoState extends State<TextLogo> {
  late String coloredText = '';
  late String remainText = '';

  @override
  void initState() {
    super.initState();
    coloredText = ((widget.text == null)
        ? 'RM'
        : widget.text?.substring(0, widget.coloredIndex))!;
    remainText = ((widget.text == null)
        ? 'Translator'
        : widget.text?.substring(2, widget.text?.length))!;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'Inder',
          fontSize: widget.logoSize,
          fontWeight: widget.boldAll! ? FontWeight.w700 : null,
        ),
        children: <TextSpan>[
          TextSpan(
            text: coloredText,
            style: TextStyle(
              color: themeProvider.primary,
              fontWeight: widget.boldColoredText! ? FontWeight.w700 : null,
            ),
          ),
          TextSpan(
            text: remainText,
            style: TextStyle(
              color: widget.textColor ?? themeProvider.text,
            ),
          ),
        ],
      ),
    ); //-
  }
}
