import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';

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
      this.svgColor = Palette.icon,
      required this.tooltip,
      this.padding = 3,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(padding!),
      icon: SvgPicture.asset(
        svgPath,
        width: svgSize,
        height: svgSize,
        color: svgColor,
      ),
      tooltip: tooltip,
      onPressed: onTap,
    );
  }
}
