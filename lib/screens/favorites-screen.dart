import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
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
          'Favorites',
          style: TextStyle(color: Palette.text, fontSize: 20),
        ),
        backgroundColor: Palette.scaffold,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                ...DotEnv.recent_history.map((e) {
                  return Container(
                    width: double.infinity,
                    // height: 100,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: Palette.scaffoldSecondary,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      e['text'],
                      style: const TextStyle(
                        color: Palette.text,
                        fontFamily: 'Pyidaungsu',
                      ),
                    ),
                  );
                }),
              ],
            )),
      ),
    );
  }
}
