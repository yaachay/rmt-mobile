// ignore_for_file: non_const_call_to_literal_constructor

import 'dart:math';

import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/services/translator.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _firstTextBoxController = TextEditingController();
  final TextEditingController _secondTextBoxController =
      TextEditingController();

  bool _rk2MY = true;

  double _textBoxHeight = 100.0; // Initial height

  void _adjustTextBoxHeight(String value) {
    // Calculate the new height based on the number of lines
    int lines = '\n'.allMatches(value).length + 1; // Number of lines
    setState(() {
      _textBoxHeight =
          (lines * 23.0).clamp(100.0, 700.0); // Adjust height with a limit
    });
  }

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
        title: const TextLogo(),
        centerTitle: true,
        backgroundColor: Palette.scaffold,
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
                                ? const Text(
                                    'Rakhine',
                                    style: TextStyle(
                                        color: Palette.text, fontSize: 16),
                                    key: ValueKey(0),
                                  )
                                : const Text(
                                    'Myanmar',
                                    style: TextStyle(
                                        color: Palette.text, fontSize: 16),
                                    key: ValueKey(1),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: AnimatedSwitcherPlus.translationBottom(
                            duration: const Duration(milliseconds: 500),
                            child: _rk2MY
                                ? const Text(
                                    'Myanmar',
                                    style: TextStyle(
                                        color: Palette.text, fontSize: 16),
                                    key: ValueKey(0),
                                  )
                                : const Text(
                                    'Rakhine',
                                    style: TextStyle(
                                        color: Palette.text, fontSize: 16),
                                    key: ValueKey(1),
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
                            gradient: Palette.primaryGradient,
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
                                          ? 'Type in Rakhine...'
                                          : 'Type in Myanmar...',
                                      hintStyle: const TextStyle(
                                        color: Palette.hintText,
                                        fontFamily: 'Inder',
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Palette.text,
                                      fontFamily: 'Pyidaungsu',
                                    ),
                                    onChanged: (value) {
                                      _adjustTextBoxHeight(value);
                                      setState(
                                        () async {
                                          String text = _rk2MY
                                              ? await TranslatorService.rkToMY(
                                                  value)
                                              : await TranslatorService.my2RK(
                                                  value);
                                          _secondTextBoxController.text = text;
                                        },
                                      );
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
                                    ? const SizedBox.shrink()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomTbButton(
                                            svgPath: 'assets/svgs/speaker.svg',
                                            svgSize: 23,
                                            tooltip: 'Speak',
                                            onTap: () {},
                                          ),
                                          CustomTbButton(
                                            svgPath: _rk2MY
                                                ? 'assets/svgs/copy-r.svg'
                                                : 'assets/svgs/copy-m.svg',
                                            tooltip: 'Copy',
                                            onTap: () {},
                                          ),
                                          CustomTbButton(
                                            svgPath: 'assets/svgs/cancel.svg',
                                            svgSize: 27,
                                            tooltip: 'Clear',
                                            onTap: () {
                                              _firstTextBoxController.text = '';
                                              _secondTextBoxController.text =
                                                  '';
                                              _adjustTextBoxHeight(
                                                  _firstTextBoxController.text);
                                            },
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              decoration: BoxDecoration(
                                                color: Palette.hintText
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Expanded(
                                                    child: Text(
                                                      'Generate with AI',
                                                      style: TextStyle(
                                                        color: Palette.hintText,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      gradient: Palette
                                                          .primaryGradient,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/svgs/send.svg',
                                                        width: 45,
                                                        height: 45,
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
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
                              const Text(
                                'Recent history',
                                style: TextStyle(
                                  color: Palette.hintText,
                                ),
                              ),
                              ...DotEnv.recent_history.map((e) {
                                return Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Palette.scaffoldSecondary,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    e['text'],
                                    style: const TextStyle(
                                      color: Palette.text,
                                      fontFamily: 'Pyidaungsu',
                                    ),
                                  ),
                                );
                              }),
                            ],
                          )
                        : Neumorphism(
                            offset: 2,
                            blurRadius: 10,
                            borderRadius: BorderRadius.circular(10),
                            gradient: Palette.primaryGradient,
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
                                          tooltip: 'Speak',
                                          onTap: () {},
                                        ),
                                        CustomTbButton(
                                          svgPath: _rk2MY
                                              ? 'assets/svgs/copy-m.svg'
                                              : 'assets/svgs/copy-r.svg',
                                          svgColor: Colors.white,
                                          tooltip: 'Copy',
                                          onTap: () {},
                                        ),
                                        CustomTbButton(
                                          svgPath: 'assets/svgs/copy-all.svg',
                                          svgColor: Colors.white,
                                          tooltip: 'Copy All',
                                          onTap: () {},
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
                                                tooltip: 'Favourite',
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
