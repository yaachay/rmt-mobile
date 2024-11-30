import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';

class ShareAppScreen extends StatelessWidget {
  const ShareAppScreen({super.key});

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
          'Share App',
          style: TextStyle(color: Palette.text, fontSize: 20),
        ),
        backgroundColor: Palette.scaffold,
      ),
      body: const Center(
        child: Text(
          'Share App',
          style: TextStyle(color: Palette.text),
        ),
      ),
    );
  }
}
