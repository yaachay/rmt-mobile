import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
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
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 100,
          ),
          const SizedBox(
            height: 100,
            child: Center(child: TextLogo(logoSize: 25)),
          ),
          SizedBox(
            height: 100,
            child: Center(
                child: Column(
              children: [
                LoadingAnimationWidget.progressiveDots(
                  color: Palette.primary,
                  size: 50,
                ),
                const Text(
                  'version: 1.0.0',
                  style: TextStyle(fontSize: 12, color: Palette.hintText),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
