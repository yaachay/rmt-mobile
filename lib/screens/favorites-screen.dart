import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/screens/screens.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.scaffold,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
          icon: SvgPicture.asset(
            width: 30,
            height: 30,
            'assets/svgs/menu.svg',
            color: themeProvider.text,
          ),
        ),
        title: Text(
          languageProvider.favourites,
          style: TextStyle(color: themeProvider.text, fontSize: 20),
        ),
        backgroundColor: themeProvider.scaffold,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              ...DotEnv.recent_history.asMap().entries.map(
                (e) {
                  return CustomTextItem(
                    index: e.key.toString(),
                    text: e.value['text'],
                    lang: e.value['lang'],
                    onDismissed: (direction) {
                      debugPrint(direction.toString());
                    },
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NavScreen(
                                  initalText: e.value['text'],
                                  initalLang: e.value['lang'])));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
