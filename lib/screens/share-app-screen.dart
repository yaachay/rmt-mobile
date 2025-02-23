// ignore_for_file: non_const_call_to_literal_constructor

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';
import 'package:share_plus/share_plus.dart';

class ShareAppScreen extends StatefulWidget {
  const ShareAppScreen({super.key});

  @override
  State<ShareAppScreen> createState() => _ShareAppScreenState();
}

class _ShareAppScreenState extends State<ShareAppScreen> {
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
          'Share App',
          style: TextStyle(color: Palette.text, fontSize: 20),
        ),
        backgroundColor: Palette.scaffold,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              'Scan for ${Platform.operatingSystem} app',
              style: const TextStyle(color: Palette.text, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Neumorphism(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: 200,
                height: 200,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: PrettyQrView.data(
                    errorCorrectLevel: QrErrorCorrectLevel.H,
                    data:
                        'https://raw.githubusercontent.com/yaachay/ucspkingqueenselection/main/ucsp-voting.apk',
                    decoration: PrettyQrDecoration(
                      shape: PrettyQrRoundedSymbol(color: Colors.black87),
                      image: PrettyQrDecorationImage(
                        image: const AssetImage('assets/images/logo.png'),
                        padding: const EdgeInsets.all(10),
                        scale: .3,
                        opacity: 0.8,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: CustomButton(
                svgPath: 'assets/svgs/upgrade.svg',
                text: 'Check for update',
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomBottomSheet(
                        title: 'Hello world!',
                        child: Container(
                          height: 170,
                          color: Colors.red,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Share app for:',
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
                          svgPath: 'assets/svgs/android.svg',
                          onTap: () {
                            Share.share(
                                'RM Translator Official Download Website\nhttps://yaachay.github.io\nDirect download link of RM Translator for Android.\nhttps://raw.githubusercontent.com/yaachay/rmt-release/main/rm-translator.apk');
                          }),
                      CustomCircleButton(
                          svgPath: 'assets/svgs/ios.svg',
                          onTap: () {
                            Share.share(
                                'RM Translator Official Download Website\nhttps://yaachay.github.io\nDirect download link of RM Translator for iOS.\nhttps://raw.githubusercontent.com/yaachay/rmt-release/main/rm-translator.msi');
                          }),
                      CustomCircleButton(
                          svgPath: 'assets/svgs/windows.svg',
                          onTap: () {
                            Share.share(
                                'RM Translator Official Download Website\nhttps://yaachay.github.io\nDirect download link of RM Translator for Windows.\nhttps://raw.githubusercontent.com/yaachay/rmt-release/main/rm-translator.msi');
                          }),
                      CustomCircleButton(
                          svgPath: 'assets/svgs/mac-os.svg',
                          onTap: () {
                            Share.share(
                                'RM Translator Official Download Website\nhttps://yaachay.github.io\nDirect download link of RM Translator for macOS.\nhttps://raw.githubusercontent.com/yaachay/rmt-release/main/rm-translator.dmg');
                          }),
                      CustomCircleButton(
                          svgPath: 'assets/svgs/linux.svg',
                          onTap: () {
                            Share.share(
                                'RM Translator Official Download Website\nhttps://yaachay.github.io\nDirect download link of RM Translator for Linux.\nhttps://raw.githubusercontent.com/yaachay/rmt-release/main/rm-translator.msi');
                          }),
                      const SizedBox(
                        width: 30,
                        height: 30,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
