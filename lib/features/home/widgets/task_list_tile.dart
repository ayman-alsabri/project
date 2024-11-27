import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/buttons/neumorphic_toggle_button.dart';
import 'package:project/core/models/task.dart';
import 'package:project/features/home/widgets/custom_dialog.dart';

class TaskListTile extends StatelessWidget {
  final Tasks task;
  const TaskListTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() =>  Get.dialog(CustomDialog(task: task)),
        child: Column(
      children: [
        Row(
          children: [
            Text(task.name,
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onTertiary)),
            Text(task.taskDate),
            const Expanded(child:  SizedBox()),
            NeumorphicToggleButton(
                isPressed: task.isActive == 1,
                onPressed: () {},
                pressedIcon: Icons.check,
                unPressedIcon: Icons.disabled_by_default_outlined)
          ],
        ),
        Text(task.status,
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onTertiary)),
      ],
    ));
  }
}
