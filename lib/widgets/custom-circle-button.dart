import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';

class CustomCircleButton extends StatefulWidget {
  final String svgPath;
  final double? padding;
  final void Function() onTap;

  const CustomCircleButton({
    super.key,
    required this.svgPath,
    this.padding = 6,
    required this.onTap,
  });

  @override
  State<CustomCircleButton> createState() => _CustomCircleButtonState();
}

class _CustomCircleButtonState extends State<CustomCircleButton> {
  @override
  Widget build(BuildContext context) {
    return Neumorphism(
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 45,
          height: 45,
          padding: EdgeInsets.all(widget.padding!),
          child: SvgPicture.asset(
            widget.svgPath,
          ),
        ),
      ),
    );
  }
}
