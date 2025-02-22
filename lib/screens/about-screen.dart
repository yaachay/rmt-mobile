import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final List<Map<String, String>> members = [
    {'name': 'Kyaw Zaya', 'task': 'Design, Coding'},
    {'name': 'Myat Aye Thway', 'task': 'Data, Testing'},
    {'name': 'Khin Hnin Wai', 'task': 'Data, Testing'},
    {'name': 'Nu Thandar Htun', 'task': 'Data, Testing'},
    {'name': 'Phyoe Thiri Aung', 'task': 'Data, Testing'},
    {'name': 'Kyel Sin Win Naing', 'task': 'Data, Testing'},
  ];
  final List<String> purposes = [
    'Hello world1 Hello world1 Hello world1 Hello world1 Hello world1 Hello world1 Hello world1',
    'Hello world2',
    'Hello world3',
    'Hello world4',
  ];
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
          'About',
          style: TextStyle(color: Palette.text, fontSize: 20),
        ),
        backgroundColor: Palette.scaffold,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                  width: double.infinity,
                ),
                IconLogo(
                  iconSize: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextLogo(logoSize: 20),
                      Text(
                        DotEnv.packageName,
                        style: TextStyle(
                          color: Palette.hintText,
                        ),
                      ),
                      Text(
                        "version: ${DotEnv.versionNum}",
                        style: TextStyle(
                          color: Palette.hintText,
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
                  const Text(
                    'Members',
                    style: TextStyle(color: Palette.hintText),
                  ),
                  ...members.map(
                    (e) => Row(
                      children: [
                        const Text(
                          ' • ',
                          style: TextStyle(color: Palette.text),
                        ),
                        Text(
                          "${e['name']!} (${e['task']})",
                          style: const TextStyle(color: Palette.text),
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
                  const Text(
                    'Purposes',
                    style: TextStyle(color: Palette.hintText),
                  ),
                  ...purposes.map(
                    (e) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' • ',
                          style: TextStyle(color: Palette.text),
                        ),
                        Expanded(
                          child: Text(
                            e,
                            style: const TextStyle(color: Palette.text),
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
                  const Text(
                    'Contact me on:',
                    style: TextStyle(
                      color: Palette.text,
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
