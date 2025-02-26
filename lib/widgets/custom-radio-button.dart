import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rakhine_myanmar_translator/models/models.dart';
import 'package:rakhine_myanmar_translator/providers/providers.dart';

class CustomRadioButton<T extends CustomRadioValue> extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final CustomRadioButtonType? type;
  final String text;
  final String? svgPath;
  final bool isActive;
  final T value;
  final void Function(T) onChanged;

  const CustomRadioButton({
    super.key,
    this.width = 70,
    this.height = 70,
    this.margin = const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    required this.text,
    this.svgPath,
    this.type = CustomRadioButtonType.normal,
    required this.isActive,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return (type == CustomRadioButtonType.square)
        ? Tooltip(
            message: text,
            child: InkWell(
              onTap: () => onChanged(value),
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        isActive ? themeProvider.primary : themeProvider.text,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      svgPath!,
                      fit: BoxFit.cover,
                    ),
                    isActive
                        ? Positioned(
                            top: 5,
                            right: 5,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 20,
                              height: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isActive
                                      ? themeProvider.primary
                                      : themeProvider.primary,
                                  width: 1.5,
                                ),
                              ),
                              child: AnimatedContainer(
                                width: isActive ? 12 : 0,
                                height: isActive ? 12 : 0,
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isActive
                                      ? themeProvider.primary
                                      : themeProvider.text,
                                ),
                              ),
                            ),
                          )
                        : Positioned(
                            top: 5,
                            right: 5,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 20,
                              height: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isActive
                                      ? themeProvider.primary
                                      : themeProvider.text,
                                  width: 1.5,
                                ),
                              ),
                              child: AnimatedContainer(
                                width: isActive ? 12 : 0,
                                height: isActive ? 12 : 0,
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isActive
                                      ? themeProvider.scaffold
                                      : themeProvider.primary,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          )
        : InkWell(
            onTap: () => onChanged(value),
            child: Container(
              width: double.infinity,
              height: height,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              margin: margin,
              decoration: BoxDecoration(
                color:
                    isActive ? themeProvider.primary : themeProvider.scaffold,
                border: Border.all(
                  color: themeProvider.primary,
                  width: isActive ? 0 : 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: isActive ? Colors.white : themeProvider.text,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isActive ? Colors.white : themeProvider.primary,
                        width: 1.5,
                      ),
                    ),
                    child: AnimatedContainer(
                      width: isActive ? 12 : 0,
                      height: isActive ? 12 : 0,
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive ? Colors.white : themeProvider.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
