import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rakhine_myanmar_translator/providers/providers.dart';

class CustomTbButton extends StatelessWidget {
  final String svgPath;
  final double? svgSize;
  final Color? svgColor;
  final String? tooltip;
  final double? padding;
  final void Function() onTap;

  const CustomTbButton(
      {super.key,
      required this.svgPath,
      this.svgSize = 25,
      this.svgColor,
      required this.tooltip,
      this.padding = 3,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return IconButton(
      padding: EdgeInsets.all(padding!),
      icon: SvgPicture.asset(
        svgPath,
        width: svgSize,
        height: svgSize,
        color: svgColor ?? themeProvider.icon,
      ),
      tooltip: tooltip,
      onPressed: onTap,
    );
  }
}
