// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/providers/providers.dart';
import 'package:rakhine_myanmar_translator/screens/screens.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';
import 'package:wiredash/wiredash.dart';

class NavScreen extends StatefulWidget {
  final String? initalText;
  final String? initalLang;

  const NavScreen({
    super.key,
    this.initalText,
    this.initalLang,
  });

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  String _initialText = "";
  String _initialLang = "";

  final List<Widget> _screens = [
    const HomeScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
    const ShareAppScreen(),
    const AboutScreen()
  ];

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () {
    //   Provider.of<DrawerProvider>(context, listen: false).zoomDrawerController;
    // });
    if (widget.initalText != null && widget.initalLang != null) {
      setState(() {
        _initialText = widget.initalText!;
        _initialLang = widget.initalLang!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<DrawerProvider>(context, listen: false)
    // Provider.of<ThemeProvider>(context, listen: false)
    // Provider.of<LanguageProvider>(context, listen: false)

    final List<Map<String, dynamic>> menus = [
      {
        'label': Provider.of<LanguageProvider>(context, listen: false).home,
        'svgFill': 'assets/svgs/home-fill.svg',
        'svgOutline': 'assets/svgs/home-outline.svg',
      },
      {
        'label':
            Provider.of<LanguageProvider>(context, listen: false).favourites,
        'svgFill': 'assets/svgs/heart-fill.svg',
        'svgOutline': 'assets/svgs/heart-outline.svg',
      },
      {
        'label': Provider.of<LanguageProvider>(context, listen: false).settings,
        'svgFill': 'assets/svgs/setting-fill.svg',
        'svgOutline': 'assets/svgs/setting-outline.svg',
      },
      {
        'label': Provider.of<LanguageProvider>(context, listen: false).shareApp,
        'svgFill': 'assets/svgs/share-fill.svg',
        'svgOutline': 'assets/svgs/share-outline.svg',
      },
      {
        'label': Provider.of<LanguageProvider>(context, listen: false).aboutUs,
        'svgFill': 'assets/svgs/info-fill.svg',
        'svgOutline': 'assets/svgs/info-outline.svg',
      },
    ];
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => DrawerProvider()),
        ChangeNotifierProvider(create: (context) => ConnectionProvider()),
      ],
      child: ZoomDrawer(
        controller: Provider.of<DrawerProvider>(context, listen: false)
            .zoomDrawerController,
        menuScreen: Scaffold(
          backgroundColor:
              Provider.of<ThemeProvider>(context, listen: false).scaffold,
          body: Column(
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          const IconLogo(
                            iconSize: 30,
                            glowRadiusFactor: 1.2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextLogo(logoSize: 18),
                                Text(
                                  "${Provider.of<LanguageProvider>(context, listen: false).version}: ${DotEnv.versionNum}",
                                  style: TextStyle(
                                    color: Provider.of<ThemeProvider>(context,
                                            listen: false)
                                        .hintText,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                // //Custom Menu with ListView
                // child: ListView.builder(
                //     itemCount: _menus.length,
                //     itemBuilder: (context, index) {
                //       final menu = _menus[index];
                //       return CustomDrawerItem(
                //         svgPath: index == _selectedIndex
                //             ? menu['svgFill']
                //             : menu['svgOutline'],
                //         text: menu['label'],
                //         isActive: index == _selectedIndex ? true : false,
                //         onTap: () {
                //           ZoomDrawer.of(context)!.toggle();
                //           setState(() {
                //             //Reset to home screen and change screen index
                //             _initialText = "";
                //             _initialLang = "";
                //             _selectedIndex = index;
                //           });
                //         },
                //       );
                //     }),

                //Custom Menu with Column
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...menus.asMap().entries.map((e) => CustomDrawerItem(
                          svgPath: e.key ==
                                  Provider.of<DrawerProvider>(context,
                                          listen: false)
                                      .selectedIndex
                              ? e.value['svgFill']
                              : e.value['svgOutline'],
                          text: e.value['label'],
                          isActive: e.key ==
                                  Provider.of<DrawerProvider>(context,
                                          listen: false)
                                      .selectedIndex
                              ? true
                              : false,
                          onTap: () {
                            Provider.of<DrawerProvider>(context, listen: false)
                                .setSelectedIndex(e.key);
                            Provider.of<DrawerProvider>(context, listen: false)
                                .closeDrawer();
                            setState(() {
                              _initialText = "";
                              _initialLang = "";
                            });
                          },
                        )),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomButton(
                      svgPath: 'assets/svgs/feedback.svg',
                      svgSize: 40,
                      color: Provider.of<ThemeProvider>(context, listen: false)
                          .text,
                      text:
                          Provider.of<LanguageProvider>(context, listen: false)
                              .feedback,
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
        mainScreen: (_initialText == "" && _initialLang == "")
            ? _screens[Provider.of<DrawerProvider>(context, listen: false)
                .selectedIndex]
            : HomeScreen(
                text: _initialText,
                lang: _initialLang,
              ),
        mainScreenScale: 0.2,
        borderRadius: 15.0,
        angle: 0.0,
        dragOffset: 100,
        shadowLayer1Color:
            Provider.of<ThemeProvider>(context, listen: false).scaffoldShadow,
        shadowLayer2Color:
            Provider.of<ThemeProvider>(context, listen: false).scaffoldShadow,
        showShadow: true,
        boxShadow: const [
          BoxShadow(
              color: Colors.black54, offset: Offset(-.4, -.4), blurRadius: 3),
        ],
        slideWidth: Responsive.isMobile(context)
            ? MediaQuery.of(context).size.width * 0.8
            : Responsive.isTablet(context)
                ? MediaQuery.of(context).size.width * 0.32
                : MediaQuery.of(context).size.width * 0.22,
        androidCloseOnBackTap: true,
        mainScreenTapClose: true,
        menuBackgroundColor:
            Provider.of<ThemeProvider>(context, listen: false).scaffold,
      ),
    );
  }
}
