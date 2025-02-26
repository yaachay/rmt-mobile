import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/models/enum.dart';
import 'package:rakhine_myanmar_translator/models/models.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final bool _isMy = true;
  Languages? _currentLang;
  Themes? _currentTheme;
  String _currentThemeSvgPath = "assets/svgs/system-theme.svg";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onLoad();
  }

  void onLoad() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langString = prefs.getString('lang');
    _currentLang = langString != null
        ? Languages.values.firstWhere(
            (e) => e.toString() == langString,
            orElse: () => Languages.myanmar,
          )
        : null;

    String? themeString = prefs.getString('theme');
    _currentTheme = themeString != null
        ? Themes.values.firstWhere(
            (e) => e.toString() == themeString,
            orElse: () => Themes.systemDefault,
          )
        : null;
    if (_currentTheme == Themes.lightTheme) {
      _currentThemeSvgPath = 'assets/svgs/light-theme.svg';
    } else if (_currentTheme == Themes.darkTheme) {
      _currentThemeSvgPath = 'assets/svgs/dark-theme.svg';
    } else {
      _currentThemeSvgPath = 'assets/svgs/system-theme.svg';
    }
  }

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
          languageProvider.settings,
          style: TextStyle(color: themeProvider.text, fontSize: 20),
        ),
        backgroundColor: themeProvider.scaffold,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomSettingItem(
              iconPath: "assets/svgs/my-en.svg",
              title: languageProvider.language,
              subtitle: (_currentLang == Languages.myanmar)
                  ? languageProvider.myanmar
                  : languageProvider.english,
              action: CustomSettingButton(
                text: (_currentLang == Languages.myanmar)
                    ? languageProvider.myanmar
                    : languageProvider.english,
                type: CustomSettingButtonType.dropdown,
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (context, setLangState) {
                          return CustomBottomSheet(
                            svgPath: 'assets/svgs/my-en.svg',
                            title: languageProvider.language,
                            subtitle: languageProvider.chooseLanguageAsYouLike,
                            height: 300,
                            child: Column(
                              children: [
                                CustomRadioButton(
                                  text: languageProvider.myanmar,
                                  isActive: (_currentLang == Languages.myanmar)
                                      ? true
                                      : false,
                                  value: Languages.myanmar,
                                  onChanged: (value) async {
                                    setLangState(() {
                                      setState(() {
                                        languageProvider.setLanguage(value);
                                        _currentLang = value;
                                      });
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                CustomRadioButton(
                                  text: languageProvider.english,
                                  isActive: (_currentLang == Languages.english)
                                      ? true
                                      : false,
                                  value: Languages.english,
                                  onChanged: (value) {
                                    setLangState(() {
                                      setState(() {
                                        languageProvider.setLanguage(value);
                                        _currentLang = value;
                                      });
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            CustomSettingItem(
              iconPath: "assets/svgs/theme.svg",
              title: languageProvider.theme,
              subtitle: (_currentTheme == Themes.systemDefault)
                  ? languageProvider.systemDefault
                  : (_currentTheme == Themes.darkTheme)
                      ? languageProvider.darkTheme
                      : languageProvider.lightTheme,
              action: CustomSettingButton(
                text: languageProvider.theme,
                svgPath: _currentThemeSvgPath,
                type: CustomSettingButtonType.theme,
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (context, setThemeState) {
                          return CustomBottomSheet(
                            svgPath: 'assets/svgs/theme.svg',
                            title: languageProvider.theme,
                            subtitle: languageProvider.chooseThemeAsYouLike,
                            height: 270,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomRadioButton(
                                  width: 70,
                                  height: 70,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 30),
                                  text: languageProvider.systemDefault,
                                  svgPath: 'assets/svgs/system-theme.svg',
                                  type: CustomRadioButtonType.square,
                                  isActive:
                                      (_currentTheme == Themes.systemDefault)
                                          ? true
                                          : false,
                                  value: Themes.systemDefault,
                                  onChanged: (value) async {
                                    setThemeState(() {
                                      setState(() {
                                        themeProvider.setTheme(value);
                                        _currentTheme = value;
                                        _currentThemeSvgPath =
                                            'assets/svgs/system-theme.svg';
                                      });
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                CustomRadioButton(
                                  width: 70,
                                  height: 70,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 30),
                                  text: languageProvider.lightTheme,
                                  svgPath: 'assets/svgs/light-theme.svg',
                                  type: CustomRadioButtonType.square,
                                  isActive: (_currentTheme == Themes.lightTheme)
                                      ? true
                                      : false,
                                  value: Themes.lightTheme,
                                  onChanged: (value) {
                                    setThemeState(() {
                                      setState(() {
                                        themeProvider.setTheme(value);
                                        _currentTheme = value;
                                        _currentThemeSvgPath =
                                            'assets/svgs/light-theme.svg';
                                      });
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                CustomRadioButton(
                                  width: 70,
                                  height: 70,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 30),
                                  text: languageProvider.darkTheme,
                                  svgPath: 'assets/svgs/dark-theme.svg',
                                  type: CustomRadioButtonType.square,
                                  isActive: (_currentTheme == Themes.darkTheme)
                                      ? true
                                      : false,
                                  value: Themes.darkTheme,
                                  onChanged: (value) {
                                    setThemeState(() {
                                      setState(() {
                                        themeProvider.setTheme(value);
                                        _currentTheme = value;
                                        _currentThemeSvgPath =
                                            'assets/svgs/dark-theme.svg';
                                      });
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            CustomSettingItem(
              iconPath: "assets/svgs/history.svg",
              title: languageProvider.history,
              subtitle: languageProvider.clearAllHistories,
              action: CustomSettingButton(
                text: languageProvider.clear,
                type: CustomSettingButtonType.icon,
                svgPath: "assets/svgs/clear.svg",
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomBottomSheet(
                        height: 200,
                        title: languageProvider.areYouSure,
                        subtitle: languageProvider.clearAllHistories,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomSettingButton(
                                text: languageProvider.sure,
                                type: CustomSettingButtonType.icon,
                                svgPath: 'assets/svgs/clear.svg',
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            CustomSettingItem(
              iconPath: "assets/svgs/heart-fill.svg",
              title: languageProvider.Favourite,
              subtitle: languageProvider.deleteAllFavourite,
              action: CustomSettingButton(
                text: languageProvider.delete,
                type: CustomSettingButtonType.icon,
                svgPath: "assets/svgs/delete.svg",
                color: Colors.redAccent,
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomBottomSheet(
                        height: 200,
                        title: languageProvider.areYouSure,
                        subtitle:
                            languageProvider.areYouSureToDeleteAllFavourite,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomSettingButton(
                                text: languageProvider.sure,
                                type: CustomSettingButtonType.icon,
                                svgPath: 'assets/svgs/delete.svg',
                                color: Colors.redAccent,
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
