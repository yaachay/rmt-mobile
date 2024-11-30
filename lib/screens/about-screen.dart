import 'package:flutter/material.dart';
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
    {'name': 'Kyaw Zaya', 'task': 'Coding'},
    {'name': 'Myat Aye Thwel', 'task': 'Design'},
    {'name': 'Khin Hnin Wai', 'task': 'Data'},
    {'name': 'Nu Thandar Htun', 'task': 'Data'},
    {'name': 'Phyoe Thiri Aung', 'task': 'Data'},
    // {'name': '', 'task': ''},
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
          icon: const Icon(
            Icons.menu,
            color: Palette.icon,
          ),
        ),
        title: const Text(
          'About',
          style: TextStyle(color: Palette.text, fontSize: 20),
        ),
        backgroundColor: Palette.scaffold,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 110,
                  width: double.infinity,
                ),
                IconLogo(
                  iconSize: 32,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextLogo(logoSize: 20),
                      Text(
                        Data.packageName,
                        style: TextStyle(color: Palette.hintText, fontSize: 14),
                      ),
                      Text(
                        "version: ${Data.versionNum}",
                        style: TextStyle(color: Palette.hintText, fontSize: 14),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
