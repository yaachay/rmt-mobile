import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:rakhine_myanmar_translator/configs/configs.dart';

class CustomDrawerItem extends StatelessWidget {
  ///
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
    return InkWell(
      onTap: onTap,
      mouseCursor: MouseCursor.uncontrolled,
      child: ListTile(
        leading: (icon != null)
            ? Icon(
                icon,
                size: iconSize,
                color: isActive ? Palette.primary : Palette.icon,
              )
            : SvgPicture.asset(
                svgPath!,
                width: svgSize,
                height: svgSize,
                color: isActive ? Palette.primary : Palette.icon,
              ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            color: isActive ? Palette.primary : Palette.icon,
          ),
        ),
      ),
    );
  }
}
