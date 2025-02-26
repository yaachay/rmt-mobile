import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';

class CustomTextItem extends StatelessWidget {
  final String index;
  final String text;
  final String lang;
  final Function(DismissDirection) onDismissed;
  final void Function() onTap;

  const CustomTextItem({
    super.key,
    required this.index,
    required this.text,
    required this.lang,
    required this.onDismissed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Dismissible(
      key: Key(index),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Remove this item.",
            style: TextStyle(color: Colors.redAccent.withOpacity(0.8)),
          ),
        ),
      ),
      onDismissed: onDismissed,
      child: InkWell(
        hoverColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: themeProvider.scaffoldSecondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: themeProvider.text,
              fontFamily: 'Pyidaungsu',
            ),
          ),
        ),
      ),
    );
  }
}
