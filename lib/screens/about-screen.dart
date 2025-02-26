import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/models/models.dart';
import 'package:rakhine_myanmar_translator/providers/providers.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Languages? _currentLang;

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
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final List<Map<String, String>> members = [
      {
        'name': (_currentLang == Languages.myanmar) ? 'ကျော်ဇေယျ' : 'Kyaw Zaya',
        'task': 'Design, Coding'
      },
      {
        'name': (_currentLang == Languages.myanmar)
            ? 'မြတ်အေးသွယ်'
            : 'Myat Aye Thway',
        'task': 'Data, Testing'
      },
      {
        'name': (_currentLang == Languages.myanmar)
            ? 'ခင်နှင်းဝေ'
            : 'Khin Hnin Wai',
        'task': 'Data, Testing'
      },
      {
        'name': (_currentLang == Languages.myanmar)
            ? 'နုသန္တာထွန်း'
            : 'Nu Thandar Htun',
        'task': 'Data, Testing'
      },
      {
        'name': (_currentLang == Languages.myanmar)
            ? 'ဖြိုးသီရိအောင်'
            : 'Phyoe Thiri Aung',
        'task': 'Data, Testing'
      },
      {
        'name': (_currentLang == Languages.myanmar)
            ? 'ကြယ်စင်ဝင်းနိုင်'
            : 'Kyel Sin Win Naing',
        'task': 'Data, Testing'
      },
    ];
    final List<String> purposes = [
      (_currentLang == Languages.myanmar)
          ? ''
          : 'Hello world1 Hello world1 Hello world1 Hello world1 Hello world1 Hello world1 Hello world1',
      (_currentLang == Languages.myanmar) ? '' : 'Hello world2',
      (_currentLang == Languages.myanmar) ? '' : 'Hello world3',
      (_currentLang == Languages.myanmar) ? '' : 'Hello world4',
    ];
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
          languageProvider.aboutUs,
          style: TextStyle(color: themeProvider.text, fontSize: 20),
        ),
        backgroundColor: themeProvider.scaffold,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                  width: double.infinity,
                ),
                const IconLogo(
                  iconSize: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TextLogo(logoSize: 20),
                      Text(
                        DotEnv.packageName,
                        style: TextStyle(
                          color: themeProvider.hintText,
                        ),
                      ),
                      Text(
                        "${languageProvider.version} : ${DotEnv.versionNum}",
                        style: TextStyle(
                          color: themeProvider.hintText,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    languageProvider.members,
                    style: TextStyle(color: themeProvider.hintText),
                  ),
                  ...members.map(
                    (e) => Row(
                      children: [
                        Text(
                          ' • ',
                          style: TextStyle(color: themeProvider.text),
                        ),
                        Text(
                          "${e['name']!} (${e['task']})",
                          style: TextStyle(color: themeProvider.text),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    languageProvider.purpose,
                    style: TextStyle(color: themeProvider.hintText),
                  ),
                  ...purposes.map(
                    (e) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' • ',
                          style: TextStyle(color: themeProvider.text),
                        ),
                        Expanded(
                          child: Text(
                            e,
                            style: TextStyle(color: themeProvider.text),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Text(
                    languageProvider.contactMeOn,
                    style: TextStyle(
                      color: themeProvider.text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 30,
                        height: 30,
                      ),
                      CustomCircleButton(
                          svgPath: 'assets/svgs/gmail.svg',
                          padding: 7,
                          onTap: () {
                            debugPrint('Mail');
                          }),
                      CustomCircleButton(
                          svgPath: 'assets/svgs/linkedin.svg',
                          onTap: () {
                            debugPrint('LinkedIn');
                          }),
                      CustomCircleButton(
                          svgPath: 'assets/svgs/facebook.svg',
                          onTap: () {
                            debugPrint('Facebook');
                          }),
                      CustomCircleButton(
                          svgPath: 'assets/svgs/telegram.svg',
                          onTap: () {
                            debugPrint('Telegram');
                          }),
                      CustomCircleButton(
                          svgPath: 'assets/svgs/viber.svg',
                          padding: 7,
                          onTap: () {
                            debugPrint('Viber');
                          }),
                      const SizedBox(
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
