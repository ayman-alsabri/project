import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:project/core/appBar/main_app_bar.dart';
import 'package:project/core/drawer/my_drawer.dart';
import 'package:project/core/scaffolds/gradiant_scaffold.dart';
import 'package:project/core/services/setting_service.dart';


part 'controllers/drawer_scaffold_controller.dart';

class DrawerScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  const DrawerScaffold({
    required this.body,
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(_DrawerScaffoldController());
    return Obx(() {
      final drawerIsShown = controller.animationValue.value == 1;
      return PopScope(
        canPop: controller.animationValue.value == 0,
        onPopInvokedWithResult: (didPop, result) {
          if (controller.animationValue.value == 0) return;
          controller.closeDrawer();
        },
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            final movement = details.velocity.pixelsPerSecond.dx;
            if (movement > 100) {
              controller.closeDrawer();
              return;
            }
            if (movement < -100) {
              controller.openDrawer();
            }
          },
          child: Stack(
            children: [
              Container(
                color: Color.alphaBlend(
                    Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    Theme.of(context).colorScheme.shadow),
              ),
              const MyDrawer().animate(
                  effects: controller.drawerEffects,
                  target: drawerIsShown ? 1 : 0,
                  key: ValueKey(title)),
              IgnorePointer(
                ignoring: drawerIsShown,
                child: AnimatedContainer(
                  clipBehavior: Clip.antiAlias,
                  duration: _DrawerScaffoldController.duration,
                  curve: Curves.easeInCubic,
                  decoration: BoxDecoration(
                      borderRadius:
                          drawerIsShown ? BorderRadius.circular(24) : null,
                      boxShadow: drawerIsShown
                          ? [
                              BoxShadow(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  spreadRadius: 10,
                                  offset: const Offset(0, 10),
                                  blurRadius: 20)
                            ]
                          : []),
                  child: GradientScaffold(
                    appBar: MainAppBar(
                      isDrawerShown: drawerIsShown,
                      title: title,
                      onDrawerButtonPressed: controller.openDrawer,
                      onThemeSwitcherPressed: controller.toggleTheme,
                    ),
                    body: body,
                  ),
                ).animate(
                  key: ValueKey(title),
                  effects: controller.transitionEffects,
                  target: controller.animationValue.value,
                  // target: controller.animationValue.value == 0 ? 0.0 : 1.0,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
