import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
          icon: SvgPicture.asset(
            width: 30,
            height: 30,
            'assets/svgs/menu.svg',
            color: Palette.text,
          ),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(color: Palette.text, fontSize: 20),
        ),
        backgroundColor: Palette.scaffold,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: const Center(
        child: Text(
          'Settings',
          style: TextStyle(color: Palette.text),
        ),
      ),
    );
  }
}
