import 'package:flutter/material.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';

class Neumorphism extends StatelessWidget {
  /// The [child] contained by `Neumorphism` Widget.
  final Widget child;

  /// The background color of `Neumorphism` Widget.
  final Color? backgroundColor;

  /// The width of `Neumorphism` Widget.
  final double? width;

  /// The height of `Neumorphism` Widget.
  final double? height;

  /// Set the offset for `BoxShadow`.
  final double? offset;

  //Set the blurRadius for `BoxShadow`.
  final double? blurRadius;

  /// The border radius of `Neumorphism` Widget.
  final BorderRadius? borderRadius;

  const Neumorphism({
    super.key,
    this.backgroundColor = Palette.scaffold,
    this.width,
    this.height,
    this.offset = 4.0,
    this.blurRadius = 15,
    this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Palette.topBoxShadow,
            blurRadius: blurRadius!,
            offset: Offset(-offset!, -offset!),
          ),
          BoxShadow(
            color: Palette.bottomBoxShadow,
            blurRadius: blurRadius!,
            offset: Offset(offset!, offset!),
          ),
        ],
      ),
      child: child,
    );
  }
}
