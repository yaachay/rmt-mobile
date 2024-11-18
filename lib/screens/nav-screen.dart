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

  final List<IconData> _icons = [
    MdiIcons.homeVariant,
    MdiIcons.crosshairsGps,
    MdiIcons.heart,
    MdiIcons.cog,
    MdiIcons.share,
    MdiIcons.information
  ];

  final List<String> _menus = [
    'Home',
    'AI Generator',
    'Favorites',
    'Settings',
    'Share App',
    'About'
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
                          Text("version: ${Data.versionNum}",
                              style: TextStyle(
                                  color: Palette.hintText, fontSize: 12))
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
                    itemCount: _icons.length,
                    itemBuilder: (context, index) {
                      return CustomDrawerItem(
                        icon: _icons[index],
                        text: _menus[index],
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
                    icon: Icons.feedback,
                    text: 'Feedback',
                    onTap: () {
                      _zoomDrawerController!.close;
                      Wiredash.of(context).show();
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
