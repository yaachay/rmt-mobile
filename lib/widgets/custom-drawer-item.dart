import 'package:flutter/material.dart';

import 'package:rakhine_myanmar_translator/configs/configs.dart';

class CustomDrawerItem extends StatelessWidget {
  ///
  final IconData icon;

  /// The size of the icon.
  final double? iconSize;

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
      required this.icon,
      this.iconSize,
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
        leading: Icon(
          icon,
          size: iconSize,
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
