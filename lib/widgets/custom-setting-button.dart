import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';

class CustomSettingButton extends StatefulWidget {
  final String text;
  final bool? isDropdown;
  final String? svgPath;
  final Color? color;
  final void Function() onTap;

  const CustomSettingButton({
    super.key,
    required this.text,
    this.isDropdown = false,
    this.svgPath,
    this.color = Palette.text,
    required this.onTap,
  });

  @override
  State<CustomSettingButton> createState() => _CustomSettingButtonState();
}

class _CustomSettingButtonState extends State<CustomSettingButton> {
  Color _bgColor = Palette.scaffold;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            _bgColor = widget.color!.withValues(alpha: 0.07);
          });
        } else {
          setState(() {
            _bgColor = Palette.scaffold;
          });
        }
      },
      onTap: widget.onTap,
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: widget.color!),
          borderRadius: BorderRadius.circular(7),
          color: _bgColor,
        ),
        child: Row(
          children: [
            (widget.isDropdown == true)
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      widget.svgPath!,
                      width: 25,
                      height: 25,
                      color: widget.color!,
                    ),
                  ),
            Text(
              widget.text,
              style: TextStyle(
                color: widget.color!,
              ),
            ),
            (widget.isDropdown == true)
                ? Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: SvgPicture.asset(
                      'assets/svgs/dropdown.svg',
                      color: widget.color!,
                      width: 20,
                      height: 20,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
