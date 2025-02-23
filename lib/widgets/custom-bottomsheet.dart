import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';

class CustomBottomSheet extends StatefulWidget {
  final String title;
  final String? subtitle;
  final Widget child;

  const CustomBottomSheet({
    super.key,
    required this.title,
    this.subtitle,
    required this.child,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 100,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Palette.hintText,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/svgs/cancel.svg',
                          width: 25,
                          height: 25,
                          color: Palette.text,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            widget.title,
            style: const TextStyle(
              color: Palette.text,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          (widget.subtitle != '')
              ? Text(
                  widget.subtitle!,
                  style: const TextStyle(color: Palette.text),
                )
              : const SizedBox.shrink(),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}
