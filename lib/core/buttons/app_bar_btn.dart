import 'package:get/get.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class AppBarButton extends StatefulWidget {
  final Future<void> Function() onTap;
  final IconData icon;

  const AppBarButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      style: NeumorphicStyle(
        boxShape: const NeumorphicBoxShape.circle(),
        border: NeumorphicBorder(width: 2, color: Get.theme.colorScheme.shadow),
        color: Get.theme.colorScheme.tertiary,
        depth: _isTapped ? 0 : 5,
        intensity: 0.8,
        shape: NeumorphicShape.flat,
        shadowDarkColor: Get.theme.colorScheme.secondary,
        shadowDarkColorEmboss: Get.theme.colorScheme.secondary.withOpacity(0.8),
        shadowLightColor: Get.theme.colorScheme.onSecondary,
        shadowLightColorEmboss:
            Get.theme.colorScheme.onSecondary.withOpacity(0.8),
      ),
      child: Icon(
        widget.icon,
        color: Get.theme.colorScheme.onTertiary,
      ),
      onPressed: () async {
        setState(() {
          _isTapped = true;
        });
        await widget.onTap();
        setState(() {
          _isTapped = false;
        });
      },
    );
  }
}
