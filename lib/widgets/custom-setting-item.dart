import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';

class CustomSettingItem extends StatelessWidget {
  final String iconPath;
  final double iconSize;
  final String title;
  final String subtitle;
  final Widget action;

  const CustomSettingItem({
    super.key,
    required this.iconPath,
    this.iconSize = 30,
    required this.title,
    required this.subtitle,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 7,
      ),
      child: Neumorphism(
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  iconPath,
                  width: iconSize,
                  height: iconSize,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Palette.text,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Palette.hintText,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
              action,
            ],
          ),
        ),
      ),
    );
  }
}
