import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:project/core/models/task.dart';

class CustomDialog extends StatelessWidget {
  final Tasks task;
  const CustomDialog({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  task.name,
                  style: TextStyle(
                      fontSize: 26,
                      color: Theme.of(context).colorScheme.onTertiary),
                ),
                Text(task.taskDate),
                const Expanded(child: SizedBox()),
                Neumorphic(
                  style: NeumorphicStyle(
                    border: NeumorphicBorder(
                        width: 2, color: Theme.of(context).colorScheme.shadow),
                    color: Theme.of(context).colorScheme.tertiary,
                    depth: -5,
                    intensity: 0.8,
                    surfaceIntensity: 0.8,
                    shape: NeumorphicShape.flat,
                    shadowDarkColor: Theme.of(context).colorScheme.secondary,
                    shadowDarkColorEmboss: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.8),
                    shadowLightColor: Theme.of(context).colorScheme.onSecondary,
                    shadowLightColorEmboss: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(0.8),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    height: 75,
                    width: 60,
                    child: Column(
                      children: [
                        Text(
                          'priority',
                          style: TextStyle(
                              fontSize: 8,
                              color: Theme.of(context).colorScheme.onTertiary),
                        ),
                        FittedBox(child: Text(task.status)),
                        SizedBox(height: 4),
                        Text(
                          'stutus',
                          style: TextStyle(
                              fontSize: 8,
                              color: Theme.of(context).colorScheme.onTertiary),
                        ),
                        FittedBox(child: Text(task.priority)),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              task.decription,
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onTertiary),
            ),
            const SizedBox(height: 20),
            Text(
              task.status,
            )
          ],
        ),
      ),
    );
  }
}
