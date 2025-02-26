import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rakhine_myanmar_translator/providers/providers.dart';

class CustomDrawerItem extends StatelessWidget {
  /// Leading icon for CustomDrawerItem
  final IconData? icon;

  /// The size of the icon.
  final double? iconSize;

  ///
  final String? svgPath;

  /// The size of the icon.
  final double? svgSize;

  /// The title of `CustomDrawerItem`.
  final String text;

  /// The font size of title.
  final double? textSize;

  /// The state of item.
  final bool isActive;

  /// The action that will work when `CustomDrawerItem` is clicked.
  final void Function() onTap;

  const CustomDrawerItem(
      {super.key,
      this.icon,
      this.iconSize,
      this.svgPath,
      this.svgSize,
      required this.text,
      this.textSize,
      this.isActive = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return InkWell(
      onTap: onTap,
      mouseCursor: MouseCursor.uncontrolled,
      child: ListTile(
        leading: (icon != null)
            ? Icon(
                icon,
                size: iconSize,
                color: isActive ? themeProvider.primary : themeProvider.icon,
              )
            : SvgPicture.asset(
                svgPath!,
                width: svgSize,
                height: svgSize,
                color: isActive ? themeProvider.primary : themeProvider.icon,
              ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            color: isActive ? themeProvider.primary : themeProvider.icon,
          ),
        ),
      ),
    );
  }
}
