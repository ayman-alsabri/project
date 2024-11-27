import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class MyNeumorphicTextButton extends StatefulWidget {
  final Future<void> Function() onTap;
  final String child;
  final double fontSize;

  const MyNeumorphicTextButton({
    super.key,
    required this.onTap,
    required this.child,
    this.fontSize = 18,
  });

  @override
  State<MyNeumorphicTextButton> createState() => _MyNeumorphicTextButtonState();
}

class _MyNeumorphicTextButtonState extends State<MyNeumorphicTextButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          _isTapped = true;
        });
        await widget.onTap();
        setState(() {
          _isTapped = false;
        });
      },
      child: NeumorphicButton(
        style: NeumorphicStyle(
          border:
              NeumorphicBorder(width: 2, color: Theme.of(context).colorScheme.shadow),
          color: _isTapped
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.tertiary,
          depth: 5,
          intensity: 0.8,
          surfaceIntensity: 0.8,
          shape: _isTapped ? NeumorphicShape.concave : NeumorphicShape.flat,
          shadowDarkColor: Theme.of(context).colorScheme.secondary,
          shadowDarkColorEmboss:
              Theme.of(context).colorScheme.secondary.withOpacity(0.8),
          shadowLightColor: Theme.of(context).colorScheme.onSecondary,
          shadowLightColorEmboss:
              Theme.of(context).colorScheme.onSecondary.withOpacity(0.8),
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
        child: Center(
          child: _isTapped
              ? LoadingAnimationWidget.staggeredDotsWave(
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: widget.fontSize * 1.5,
                  )
              : Text(
                  widget.child,
                  style:  TextStyle(
                      fontSize: widget.fontSize, fontWeight: FontWeight.w500),
                ),
        ),
      ),
    );
  }
}
