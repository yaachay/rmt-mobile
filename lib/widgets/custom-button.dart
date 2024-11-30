import 'package:flutter/material.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final double? iconSize;
  final String text;
  final double? textSize;
  final double? borderRadius;
  final void Function() onTap;

  const CustomButton(
      {super.key,
      required this.icon,
      this.iconSize,
      required this.text,
      this.textSize,
      this.borderRadius = 10,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            gradient: Palette.primaryGradient,
            borderRadius: BorderRadius.circular(borderRadius!)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Icon(
                  icon,
                  color: Palette.icon,
                  size: 24,
                ),
              ),
              Text(text, style: const TextStyle(color: Palette.text))
            ],
          ),
        ),
      ),
    );
  }
}
