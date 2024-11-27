import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';

class NeumorphicToggleButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData pressedIcon;
  final IconData unPressedIcon;
  final bool isPressed;
  final double margin;
  final double padding;
  const NeumorphicToggleButton({
    required this.isPressed,
    required this.onPressed,
    super.key,
    required this.pressedIcon,
    required this.unPressedIcon,
    this.margin = 8,
    this.padding = 8,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
      style: NeumorphicStyle(
        boxShape: const NeumorphicBoxShape.circle(),
        border: NeumorphicBorder(width: 2, color: Get.theme.colorScheme.shadow),
        color: isPressed
            ? Get.theme.colorScheme.tertiary
            : Get.theme.colorScheme.primary,
        depth: 5,
        intensity: 0.8,
        surfaceIntensity: 0.8,
        shape: isPressed ? NeumorphicShape.flat : NeumorphicShape.concave,
        shadowDarkColor: Get.theme.colorScheme.secondary,
        shadowDarkColorEmboss: Get.theme.colorScheme.secondary.withOpacity(0.8),
        shadowLightColor: Get.theme.colorScheme.onSecondary,
        shadowLightColorEmboss:
            Get.theme.colorScheme.onSecondary.withOpacity(0.8),
      ),
      onPressed: onPressed,
      child: Icon(
        color: isPressed
            ? Get.theme.colorScheme.onTertiary
            : Get.theme.colorScheme.onPrimary,
        isPressed ? pressedIcon : unPressedIcon,
      ),
    );
  }
}
