import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/widgets/neumorphism.dart';

class CustomButton extends StatelessWidget {
  final IconData? icon;
  final double? iconSize;
  final String? svgPath;
  final double? svgSize;
  final Color? color;
  final String text;
  final double? textSize;
  final double? padding;
  final double? borderRadius;
  final void Function() onTap;

  const CustomButton(
      {super.key,
      this.icon,
      this.iconSize = 24,
      this.svgPath = '',
      this.svgSize = 24,
      this.color,
      required this.text,
      this.textSize,
      this.padding = 8.5,
      this.borderRadius = 10,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius!),
      onTap: onTap,
      child: Neumorphism(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding!),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (icon != null)
                  ? Icon(
                      icon,
                      color: color ?? themeProvider.icon,
                      size: iconSize,
                    )
                  : const SizedBox.shrink(),
              (svgPath!.isNotEmpty)
                  ? SizedBox(
                      width: svgSize,
                      height: svgSize,
                      child: SvgPicture.asset(
                        svgPath!,
                        color: color ?? themeProvider.icon,
                      ),
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(text, style: TextStyle(color: themeProvider.text)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
