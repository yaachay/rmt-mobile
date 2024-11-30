import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';

import '../configs/configs.dart';

class AiGeneratorScreen extends StatefulWidget {
  const AiGeneratorScreen({super.key});

  @override
  State<AiGeneratorScreen> createState() => _AiGeneratorScreenState();
}

class _AiGeneratorScreenState extends State<AiGeneratorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
          icon: const Icon(
            Icons.menu,
            color: Palette.icon,
          ),
        ),
        title: const Text(
          'AI Generator',
          style: TextStyle(color: Palette.text, fontSize: 20),
        ),
        backgroundColor: Palette.scaffold,
      ),
      body: const Center(
        child: Text(
          'AI Generator',
          style: TextStyle(color: Palette.text),
        ),
      ),
    );
  }
}
