part of '../drawer_scaffold.dart';

class _DrawerScaffoldController extends GetxController {
  final animationValue = 0.0.obs;
  static const duration = Duration(milliseconds: 300);
  final transitionEffects = <Effect>[
    CustomEffect(
      begin: 0,
      end: 1,
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) => Transform(
        alignment: const Alignment(0, 0),
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..setEntry(0, 3, -200 * value)
          ..rotateY(value * -3.14 / 6),
        child: child,
      ),
    )
  ];
  final drawerEffects = [
    const AlignEffect(
      curve: Curves.easeOut,
      begin: Alignment(3.3, 0),
      end: Alignment(1, 0),
      duration: duration,
    )
  ];
  bool _isAnimating = false;

  Future<void> openDrawer() async {
    if (_isAnimating || animationValue.value == 1) return;
    _isAnimating = true;
    animationValue.value = 1.0;
    await Future.delayed(duration);
    _isAnimating = false;
  }

  Future<void> closeDrawer() async {
    if (_isAnimating || animationValue.value == 0) return;
    _isAnimating = true;
    animationValue.value = 0.0;
    await Future.delayed(duration);
    _isAnimating = false;
  }

  Future<void> toggleTheme() async {
    await (Get.find<SettingsService>().toggleThemeMode());
  }
}
