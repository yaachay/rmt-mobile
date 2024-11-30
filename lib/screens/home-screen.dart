import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showFirstChild = true;
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
        title: const TextLogo(logoSize: 20),
        centerTitle: true,
        backgroundColor: Palette.scaffold,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
              child: Neumorphism(
                blurRadius: 10,
                offset: 2,
                borderRadius: BorderRadius.circular(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AnimatedSwitcherPlus.translationTop(
                        duration: const Duration(milliseconds: 500),
                        child: _showFirstChild
                            ? const Text(
                                'Rakhine',
                                style: TextStyle(color: Palette.hintText),
                                key: ValueKey(0),
                              )
                            : const Text(
                                'Myanmar',
                                style: TextStyle(color: Palette.hintText),
                                key: ValueKey(1),
                              ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _showFirstChild
                                  ? _showFirstChild = false
                                  : _showFirstChild = true;
                            });
                          },
                          icon: const Icon(
                            Icons.switch_left_outlined,
                            color: Palette.text,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: AnimatedSwitcherPlus.translationBottom(
                        duration: const Duration(milliseconds: 500),
                        child: _showFirstChild
                            ? const Text(
                                'Myanmar',
                                style: TextStyle(color: Palette.hintText),
                                key: ValueKey(0),
                              )
                            : const Text(
                                'Rakhine',
                                style: TextStyle(color: Palette.hintText),
                                key: ValueKey(1),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
              child: NeumorphismTextBox(
                width: 200,
                height: 200,
                borderRadius: BorderRadius.circular(10),
                child: Container(),
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
