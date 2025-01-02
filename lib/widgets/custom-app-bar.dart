import 'package:flutter/material.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';

class CustomAppBar extends StatefulWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Row(
        children: [Text(widget.title)],
      ),
    );
  }
}
