import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';

part 'controller/my_drawer_controller.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final apptheme = Theme.of(context);
    return SafeArea(
      child: Container(
        width: Get.width * 3.14 / 6,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              Text(
                'About us',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: apptheme.colorScheme.onPrimary),
              ),
              const SizedBox(height: 32),
              Column(
                children: [
                 Text(
                 'Amjad, Ayman, and Emad we are impetiont Flutter developers studying CS and IT.',
                 style: TextStyle(
                   fontSize: 18,
                   color: apptheme.colorScheme.onTertiary,
                 ),
                 ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
