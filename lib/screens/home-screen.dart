// ignore_for_file: non_const_call_to_literal_constructor

import 'dart:math';

import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/services/services.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  final String? text;
  final String? lang;

  const HomeScreen({
    super.key,
    this.text,
    this.lang,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _firstTextBoxController = TextEditingController();
  final TextEditingController _secondTextBoxController =
      TextEditingController();

  bool _rk2MY = true;
  bool _isPasteable = false;

  double _textBoxHeight = 100.0; // Initial Height

  // Calculate the new height based on the number of lines
  void _adjustTextBoxHeight(String value) {
    int lines = '\n'.allMatches(value).length + 1;
    setState(() {
      _textBoxHeight = (lines * 23.0).clamp(100.0, 700.0);
    });
  }

  @override
  void initState() {
    super.initState();

    // Check if widget.text and widget.lang are not null
    if (widget.text != null && widget.lang != null) {
      String initialText = widget.text!;

      // Perform translation based on the language (rk or my)
      if (widget.lang == "rk") {
        _translateAndSetState(initialText, true, TranslatorService.rkToMY);
      } else if (widget.lang == "my") {
        _translateAndSetState(initialText, false, TranslatorService.myToRK);
      }
    }
    checkClipboard();
  }

  void checkClipboard() async {
    bool haveData = await ClipboardService.haveData();
    setState(() {
      _isPasteable = haveData;
    });
  }

// Helper function to perform translation and update UI state
  Future<void> _translateAndSetState(String initialText, bool rk2MY,
      Future<String> Function(String) translationFunction) async {
    String translatedText = await translationFunction(initialText);

    setState(() {
      _rk2MY = rk2MY;
      _firstTextBoxController.text = initialText;
      _secondTextBoxController.text = translatedText;
    });
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
        title: const TextLogo(),
        centerTitle: true,
        backgroundColor: themeProvider.scaffold,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Stack(
              children: [
                Center(
                  child: Neumorphism(
                    height: 45,
                    blurRadius: 10,
                    offset: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AnimatedSwitcherPlus.translationTop(
                            duration: const Duration(milliseconds: 500),
                            child: _rk2MY
                                ? Text(
                                    languageProvider.rkLang,
                                    style: TextStyle(
                                        color: themeProvider.text,
                                        fontSize: 16),
                                    key: const ValueKey(0),
                                  )
                                : Text(
                                    languageProvider.myLang,
                                    style: TextStyle(
                                        color: themeProvider.text,
                                        fontSize: 16),
                                    key: const ValueKey(1),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: AnimatedSwitcherPlus.translationBottom(
                            duration: const Duration(milliseconds: 500),
                            child: _rk2MY
                                ? Text(
                                    languageProvider.myLang,
                                    style: TextStyle(
                                        color: themeProvider.text,
                                        fontSize: 16),
                                    key: const ValueKey(0),
                                  )
                                : Text(
                                    languageProvider.rkLang,
                                    style: TextStyle(
                                        color: themeProvider.text,
                                        fontSize: 16),
                                    key: const ValueKey(1),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Transform.rotate(
                    angle: pi / 4,
                    child: Neumorphism(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            gradient: themeProvider.primaryGradient,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: IconButton(
                            hoverColor: Colors.transparent,
                            onPressed: () {
                              setState(
                                () {
                                  _rk2MY ? _rk2MY = false : _rk2MY = true;
                                },
                              );
                            },
                            icon: Transform.rotate(
                              angle: -(pi / 4),
                              child: const Icon(
                                Icons.switch_left_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Neumorphism(
                        offset: 2,
                        blurRadius: 10,
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: double.infinity,
                          height: _textBoxHeight + 70,
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    controller: _firstTextBoxController,
                                    keyboardType: TextInputType.multiline,
                                    minLines: 1,
                                    maxLines: null,
                                    decoration: InputDecoration.collapsed(
                                      hintText: _rk2MY
                                          ? languageProvider.rkHint
                                          : languageProvider.myHint,
                                      hintStyle: TextStyle(
                                        color: themeProvider.hintText,
                                        fontFamily: 'Inder',
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: themeProvider.text,
                                      fontFamily: 'Pyidaungsu',
                                    ),
                                    onChanged: (value) async {
                                      _adjustTextBoxHeight(value);

                                      String text = _rk2MY
                                          ? await TranslatorService.rkToMY(
                                              value)
                                          : await TranslatorService.myToRK(
                                              value);

                                      setState(() {
                                        _secondTextBoxController.text = text;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 40,
                                child: (_firstTextBoxController.text.isEmpty)
                                    ? (_isPasteable)
                                        ? Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CustomTbButton(
                                                svgPath:
                                                    'assets/svgs/paste.svg',
                                                tooltip: languageProvider.paste,
                                                onTap: () async {
                                                  String text =
                                                      await ClipboardService
                                                              .paste() ??
                                                          '';

                                                  String translateText = _rk2MY
                                                      ? await TranslatorService
                                                          .rkToMY(text)
                                                      : await TranslatorService
                                                          .myToRK(text);

                                                  setState(() {
                                                    _firstTextBoxController
                                                        .text = text;
                                                    _secondTextBoxController
                                                        .text = translateText;
                                                  });
                                                },
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomTbButton(
                                            svgPath: 'assets/svgs/speaker.svg',
                                            svgSize: 23,
                                            tooltip: languageProvider.speak,
                                            onTap: () {},
                                          ),
                                          CustomTbButton(
                                            svgPath: _rk2MY
                                                ? 'assets/svgs/copy-r.svg'
                                                : 'assets/svgs/copy-m.svg',
                                            tooltip: languageProvider.copy,
                                            onTap: () {
                                              ClipboardService.copy(
                                                  _firstTextBoxController.text);
                                            },
                                          ),
                                          const Expanded(
                                            child: SizedBox.shrink(),
                                          ),
                                          CustomTbButton(
                                            svgPath: 'assets/svgs/cancel.svg',
                                            svgSize: 27,
                                            tooltip: languageProvider.clear,
                                            onTap: () {
                                              _firstTextBoxController.text = '';
                                              _secondTextBoxController.text =
                                                  '';
                                              _adjustTextBoxHeight(
                                                  _firstTextBoxController.text);
                                              checkClipboard();
                                            },
                                          ),
                                        ],
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    (_firstTextBoxController.text.isEmpty)
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: double.infinity,
                                height: 20,
                              ),
                              Text(
                                languageProvider.recentHistory,
                                style: TextStyle(
                                  color: themeProvider.hintText,
                                ),
                              ),
                              ...DotEnv.recent_history.asMap().entries.map((e) {
                                return CustomTextItem(
                                  index: e.key.toString(),
                                  text: e.value['text'],
                                  lang: e.value['lang'],
                                  onDismissed: (direction) {
                                    setState(() {
                                      DotEnv.recent_history.removeAt(e.key);
                                    });
                                  },
                                  onTap: () async {
                                    _rk2MY = (e.value["lang"] == "rk")
                                        ? true
                                        : false;
                                    _firstTextBoxController.text =
                                        e.value['text'];

                                    String translatedText = _rk2MY
                                        ? await TranslatorService.rkToMY(
                                            e.value['text'])
                                        : await TranslatorService.myToRK(
                                            e.value['text']);

                                    setState(() {
                                      _secondTextBoxController.text =
                                          translatedText;
                                    });
                                  },
                                );
                              }),
                            ],
                          )
                        : Neumorphism(
                            offset: 2,
                            blurRadius: 10,
                            borderRadius: BorderRadius.circular(10),
                            gradient: themeProvider.primaryGradient,
                            child: SizedBox(
                              width: double.infinity,
                              height: _textBoxHeight + 70,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0,
                                          top: 10.0,
                                          right: 10.0,
                                          bottom: 5.0),
                                      child: TextFormField(
                                        controller: _secondTextBoxController,
                                        keyboardType: TextInputType.multiline,
                                        minLines: 1,
                                        maxLines: null,
                                        decoration:
                                            const InputDecoration.collapsed(
                                          hintText: '',
                                        ),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Pyidaungsu',
                                        ),
                                        readOnly: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomTbButton(
                                          svgPath: 'assets/svgs/speaker.svg',
                                          svgSize: 23,
                                          svgColor: Colors.white,
                                          tooltip: languageProvider.speak,
                                          onTap: () {},
                                        ),
                                        CustomTbButton(
                                          svgPath: _rk2MY
                                              ? 'assets/svgs/copy-m.svg'
                                              : 'assets/svgs/copy-r.svg',
                                          svgColor: Colors.white,
                                          tooltip: languageProvider.copy,
                                          onTap: () {
                                            ClipboardService.copy(
                                                _secondTextBoxController.text);
                                          },
                                        ),
                                        CustomTbButton(
                                          svgPath: 'assets/svgs/copy-all.svg',
                                          svgColor: Colors.white,
                                          tooltip: languageProvider.copyAll,
                                          onTap: () {
                                            String text = _rk2MY
                                                ? "<ရခိုင်ဘာသာ>\n ${_firstTextBoxController.text}\n\n<မြန်မာဘာသာ>\n${_secondTextBoxController.text}"
                                                : "<မြန်မာဘာသာ>\n${_firstTextBoxController.text}\n\n<ရခိုင်ဘာသာ>\n${_secondTextBoxController.text}";
                                            ClipboardService.copy(text);
                                          },
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CustomTbButton(
                                                svgPath:
                                                    'assets/svgs/heart-outline.svg',
                                                svgColor: Colors.white,
                                                tooltip:
                                                    languageProvider.favourite,
                                                onTap: () {},
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
