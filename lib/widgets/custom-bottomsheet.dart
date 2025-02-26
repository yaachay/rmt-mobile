import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rakhine_myanmar_translator/providers/providers.dart';

class CustomBottomSheet extends StatelessWidget {
  final String? svgPath;
  final String title;
  final String? subtitle;
  final double? height;
  final Widget child;

  const CustomBottomSheet({
    super.key,
    this.svgPath = 'assets/svgs/notice.svg',
    required this.title,
    this.subtitle = '',
    this.height = 300,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: themeProvider.scaffold,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 100,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: themeProvider.hintText,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/svgs/cancel.svg',
                          width: 25,
                          height: 25,
                          color: themeProvider.text,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  svgPath!,
                  width: 50,
                  height: 50,
                  color: themeProvider.icon,
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: themeProvider.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    (subtitle != '')
                        ? Text(
                            subtitle!,
                            style: TextStyle(color: themeProvider.text),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height! - 130, child: child),
        ],
      ),
    );
  }
}
