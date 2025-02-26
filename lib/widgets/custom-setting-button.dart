import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/models/models.dart';

class CustomSettingButton extends StatelessWidget {
  final String text;
  final CustomSettingButtonType type;
  final String? svgPath;
  final Color? color;
  final void Function() onTap;

  const CustomSettingButton({
    super.key,
    required this.text,
    required this.type,
    this.svgPath,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return (type == CustomSettingButtonType.theme)
        ? InkWell(
            onTap: onTap,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: themeProvider.text, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                svgPath!,
                fit: BoxFit.cover,
              ),
            ),
          )
        : InkWell(
            onTap: onTap,
            child: Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: color ?? themeProvider.text),
                borderRadius: BorderRadius.circular(7),
                color: (type == CustomSettingButtonType.icon)
                    ? color ?? themeProvider.text
                    : themeProvider.scaffold,
              ),
              child: Row(
                children: [
                  (type == CustomSettingButtonType.dropdown)
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SvgPicture.asset(
                            svgPath!,
                            width: 25,
                            height: 25,
                            color: (type == CustomSettingButtonType.icon)
                                ? (color != null)
                                    ? Colors.white
                                    : themeProvider.scaffold
                                : color ?? themeProvider.text,
                          ),
                        ),
                  Text(
                    text,
                    style: TextStyle(
                      color: (type == CustomSettingButtonType.icon)
                          ? (color != null)
                              ? Colors.white
                              : themeProvider.scaffold
                          : color ?? themeProvider.text,
                    ),
                  ),
                  (type == CustomSettingButtonType.dropdown)
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: SvgPicture.asset(
                            'assets/svgs/dropdown.svg',
                            color: color ?? themeProvider.text,
                            width: 20,
                            height: 20,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          );
  }
}
