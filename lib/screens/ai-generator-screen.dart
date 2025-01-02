import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../configs/configs.dart';

class AiGeneratorScreen extends StatefulWidget {
  const AiGeneratorScreen({super.key});

  @override
  State<AiGeneratorScreen> createState() => _AiGeneratorScreenState();
}

class _AiGeneratorScreenState extends State<AiGeneratorScreen> {
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
        title: const TextLogo(
          text: 'AI Generator',
          coloredIndex: 2,
          boldColoredText: false,
        ),
        backgroundColor: Palette.scaffold,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Container(
            width: 500,
            height: 2000,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class _AiGenerating extends StatelessWidget {
  const _AiGenerating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Shimmer.fromColors(
          baseColor: Palette.shimmerBase,
          highlightColor: Palette.white25,
          period: const Duration(milliseconds: 800),
          child: Container(
            width: 160,
            height: 30,
            decoration: BoxDecoration(
              color: Palette.white25,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        const Text(
          'Generating with AI...',
          style: TextStyle(color: Palette.text),
        ),
      ],
    );
  }
}
