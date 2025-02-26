import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/providers/providers.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/nav');
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.scaffold,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 100,
          ),
          const SizedBox(
            height: 100,
            child: Center(child: TextLogo(logoSize: 28)),
          ),
          SizedBox(
            height: 100,
            child: Center(
                child: Column(
              children: [
                LoadingAnimationWidget.progressiveDots(
                  color: themeProvider.primary,
                  size: 50,
                ),
                Text(
                  '${languageProvider.version} : ${DotEnv.versionNum}',
                  style: TextStyle(color: themeProvider.hintText),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
