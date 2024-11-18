import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:rakhine_myanmar_translator/configs/configs.dart';

class IconLogo extends StatelessWidget {
  /// The size of the logo icon.
  final double? iconSize;

  /// The factor that determines the size of each glow effect relative to the original size.
  final double? glowRadiusFactor;

  const IconLogo({
    super.key,
    this.iconSize = 30,
    this.glowRadiusFactor = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      startDelay: const Duration(milliseconds: 1000),
      // duration: const Duration(seconds: 30),
      glowCount: 5,
      glowColor: Palette.primary,
      glowShape: BoxShape.circle,
      glowRadiusFactor: glowRadiusFactor!,
      animate: true,
      curve: Curves.fastOutSlowIn,
      child: Material(
        elevation: 100.0,
        shape: const CircleBorder(),
        color: Colors.transparent,
        child: CircleAvatar(
          backgroundImage: const AssetImage('assets/images/logo-round.png'),
          radius: iconSize,
        ),
      ),
    );
  }
}
