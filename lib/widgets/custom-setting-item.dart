import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/providers/providers.dart';
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
    this.iconSize = 35,
    required this.title,
    required this.subtitle,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Container(
      height: 70,
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
                  color: themeProvider.text,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: themeProvider.text,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: themeProvider.hintText,
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
