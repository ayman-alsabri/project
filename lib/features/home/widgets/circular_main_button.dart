import 'package:get/get.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class CircularMainButton extends StatelessWidget {
  final int numberOfTasks;
  final int done;
  final int late;

  const CircularMainButton({
    super.key,
    required this.numberOfTasks,
    required this.done,
    required this.late,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        width: Get.width - 120,
        height: Get.width - 120,
        child: Neumorphic(
          padding: const EdgeInsets.all(16),
          style: NeumorphicStyle(
            boxShape: const NeumorphicBoxShape.circle(),
            border: NeumorphicBorder(
                width: 2, color: Theme.of(context).colorScheme.shadow),
            color: Theme.of(context).colorScheme.tertiary,
            depth: 8,
            intensity: 0.8,
            shape: NeumorphicShape.flat,
            shadowDarkColor: Theme.of(context).colorScheme.secondary,
            shadowDarkColorEmboss:
                Theme.of(context).colorScheme.secondary.withOpacity(0.8),
            shadowLightColor: Theme.of(context).colorScheme.onSecondary,
            shadowLightColorEmboss:
                Theme.of(context).colorScheme.onSecondary.withOpacity(0.8),
          ),
          child: numberOfTasks == 0
              ? const Center(child: Text('No tasks yet',style:  TextStyle(fontSize: 32,fontWeight: FontWeight.w700),))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      numberOfTasks.toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Done',
                            ),
                            Text(done.toString()),
                            SizedBox(
                              height: 10,
                              width: 40,
                              child: LinearProgressIndicator(
                                borderRadius: BorderRadius.circular(15),
                                value: done / numberOfTasks,
                                backgroundColor: Colors.grey[300],
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Column(
                          children: [
                            const Text('Late'),
                            Text(late.toString()),
                            SizedBox(
                              height: 10,
                              width: 40,
                              child: LinearProgressIndicator(
                                borderRadius: BorderRadius.circular(15),
                                value: late / numberOfTasks,
                                backgroundColor: Colors.grey[300],
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Column(
                          children: [
                            const Text('Pending'),
                            Text(late.toString()),
                            SizedBox(
                              height: 10,
                              width: 40,
                              child: LinearProgressIndicator(
                                borderRadius: BorderRadius.circular(15),
                                value: late / numberOfTasks,
                                backgroundColor: Colors.grey[300],
                                color: Colors.cyan,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            const BorderRadius.all(Radius.circular(25))),
                        color: Theme.of(context).colorScheme.secondary,
                        depth: -8,
                        intensity: 0.8,
                        shape: NeumorphicShape.flat,
                        shadowDarkColor:
                            Theme.of(context).colorScheme.secondary,
                        shadowDarkColorEmboss: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.8),
                        shadowLightColor:
                            Theme.of(context).colorScheme.onSecondary,
                        shadowLightColorEmboss: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(0.8),
                      ),
                      child: Container(
                        color: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Text(
                          'Done Rate: ${(done / numberOfTasks * 100).toStringAsFixed(1)}%',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
