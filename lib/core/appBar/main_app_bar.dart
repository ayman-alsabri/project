import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:project/core/buttons/app_bar_btn.dart';
import 'package:project/core/buttons/neumorphic_toggle_button.dart';


class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isDrawerShown;
  final Future<void> Function() onDrawerButtonPressed;
  final Future<void> Function() onThemeSwitcherPressed;

  const MainAppBar({
    super.key,
    required this.title,
    required this.isDrawerShown,
    required this.onDrawerButtonPressed,
    required this.onThemeSwitcherPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           
            AppBarButton(
                onTap: onThemeSwitcherPressed,
                icon: Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            Text(
              title,
              style: TextStyle(
                  color: Get.theme.colorScheme.onTertiary,
                  fontSize: 26,
                  fontWeight: FontWeight.w700),
            ), NeumorphicToggleButton(
              pressedIcon: Icons.menu,
              unPressedIcon: Icons.menu,
              isPressed: !isDrawerShown,
              onPressed: onDrawerButtonPressed,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
