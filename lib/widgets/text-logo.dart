import 'package:flutter/material.dart';

import 'package:rakhine_myanmar_translator/configs/configs.dart';

class TextLogo extends StatelessWidget {
  /// The font size of Text Logo
  final double logoSize;
  final bool? boldRM;
  final bool? boldAll;

  /// The color of `Translator` text.
  final Color? textColor;

  const TextLogo(
      {super.key,
      required this.logoSize,
      this.boldRM = true,
      this.boldAll = false,
      this.textColor = Palette.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'Inder',
          fontSize: logoSize,
          fontWeight: boldAll! ? FontWeight.w700 : null,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'RM',
            style: TextStyle(
              color: Palette.primary,
              fontWeight: boldRM! ? FontWeight.w700 : null,
            ),
          ),
          TextSpan(
            text: 'Translator',
            style: TextStyle(
              color: textColor,
            ),
          ),
        ],
      ),
    ); //-
  }
}
