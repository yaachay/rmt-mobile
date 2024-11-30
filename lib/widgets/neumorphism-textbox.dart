import 'package:flutter/material.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';

class NeumorphismTextBox extends StatelessWidget {
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

  const NeumorphismTextBox({
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
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x3EFFFFFF),
                          offset: Offset(-4, -4),
                          blurRadius: 15)
                    ],
                    color: Color(0xFF1E1E1E),
                  ))),
          Positioned(
            top: 26,
            left: 27,
            child: Container(
              width: 150,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3E000000),
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                  )
                ],
                color: Color(0xFF1E1E1E),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
