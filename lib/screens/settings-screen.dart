import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
        title: const Text(
          'Settings',
          style: TextStyle(color: Palette.text, fontSize: 20),
        ),
        backgroundColor: Palette.scaffold,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomSettingItem(
              iconPath: "assets/svgs/theme.svg",
              title: "Theme",
              subtitle: "System Default",
              action: CustomSettingButton(
                text: 'System Default',
                isDropdown: true,
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomBottomSheet(
                        title: 'Theme',
                        subtitle: 'Select one theme as you like.',
                        child: Container(
                          height: 170,
                          color: Colors.red,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            CustomSettingItem(
              iconPath: "assets/svgs/history.svg",
              title: "History",
              subtitle: "Clear all histories.",
              action: CustomSettingButton(
                text: 'Clear',
                svgPath: "assets/svgs/clear.svg",
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomBottomSheet(
                        title: 'Are you sure?',
                        subtitle: 'Are you sure to clear all histories?',
                        child: Container(
                          height: 170,
                          color: Colors.red,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            CustomSettingItem(
              iconPath: "assets/svgs/heart-fill.svg",
              title: "Favourite",
              subtitle: "Clear all favourites.",
              action: CustomSettingButton(
                text: 'Delete',
                svgPath: "assets/svgs/delete.svg",
                color: Colors.redAccent,
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomBottomSheet(
                        title: 'Are you sure?',
                        subtitle: 'Are you sure to delete all favourites?',
                        child: Container(
                          height: 170,
                          color: Colors.red,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
