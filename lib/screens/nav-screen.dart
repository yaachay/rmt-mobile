import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/screens/screens.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';
import 'package:wiredash/wiredash.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final _zoomDrawerController = ZoomDrawerController();
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    AiGeneratorScreen(),
    FavoritesScreen(),
    SettingsScreen(),
    ShareAppScreen(),
    AboutScreen()
  ];

  final List<Map<String, dynamic>> _menus = [
    {
      'label': 'Home',
      'svgFill': 'assets/svgs/home-fill.svg',
      'svgOutline': 'assets/svgs/home-outline.svg',
    },
    {
      'label': 'AI Generator',
      'svgFill': 'assets/svgs/chat-gpt.svg',
      'svgOutline': 'assets/svgs/chat-gpt.svg',
    },
    {
      'label': 'Favourites',
      'svgFill': 'assets/svgs/heart-fill.svg',
      'svgOutline': 'assets/svgs/heart-outline.svg',
    },
    {
      'label': 'Settings',
      'svgFill': 'assets/svgs/setting-fill.svg',
      'svgOutline': 'assets/svgs/setting-outline.svg',
    },
    {
      'label': 'Share App',
      'svgFill': 'assets/svgs/share-fill.svg',
      'svgOutline': 'assets/svgs/share-outline.svg',
    },
    {
      'label': 'About',
      'svgFill': 'assets/svgs/info-fill.svg',
      'svgOutline': 'assets/svgs/info-outline.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _zoomDrawerController,
      menuScreen: Scaffold(
        backgroundColor: Palette.scaffold,
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                // color: Colors.yellow,
                child: const Row(
                  children: [
                    IconLogo(
                      iconSize: 30,
                      glowRadiusFactor: 1.2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextLogo(logoSize: 18),
                          Text("version: ${DotEnv.versionNum}",
                              style: TextStyle(
                                color: Palette.hintText,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Center(
                child: ListView.builder(
                    itemCount: _menus.length,
                    itemBuilder: (context, index) {
                      final menu = _menus[index];
                      return CustomDrawerItem(
                        svgPath: index == _selectedIndex
                            ? menu['svgFill']
                            : menu['svgOutline'],
                        text: menu['label'],
                        isActive: index == _selectedIndex ? true : false,
                        onTap: () {
                          ZoomDrawer.of(context)!.toggle();
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      );
                    }),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomButton(
                    svgPath: 'assets/svgs/feedback.svg',
                    svgSize: 35,
                    color: Palette.text,
                    text: 'Feedback',
                    padding: 5,
                    borderRadius: 20,
                    onTap: () {
                      Wiredash.of(context).show(
                        options: WiredashFeedbackOptions(
                          labels: [
                            ...DotEnv.wiredashLabels.map(
                              (e) => Label(id: e['id']!, title: e['label']!),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
      mainScreen: _screens[_selectedIndex],
      mainScreenScale: 0.2,
      borderRadius: 15.0,
      angle: 0.0,
      dragOffset: 100,
      shadowLayer1Color: Palette.scaffoldShadow,
      shadowLayer2Color: Palette.scaffoldShadow,
      showShadow: true,
      boxShadow: const [
        BoxShadow(
            color: Colors.black54, offset: Offset(-.4, -.4), blurRadius: 3),
      ],
      slideWidth: MediaQuery.of(context).size.width * .80,
      androidCloseOnBackTap: true,
      mainScreenTapClose: true,
      menuBackgroundColor: Palette.scaffold,
    );
  }
}
