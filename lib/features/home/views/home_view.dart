import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/models/task.dart';

import 'package:project/core/scaffolds/drawer_scaffold.dart';
import 'package:project/features/home/widgets/bottom_sheet.dart';
import 'package:project/features/home/widgets/circular_main_button.dart';
import 'package:project/features/home/widgets/task_list_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
   final tasks =  getDummyTasks();
    return DrawerScaffold(
      onTap: () => Get.bottomSheet(
         CustomBottomSheet(),
          isScrollControlled: true),
      title: 'Home',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularMainButton(
            //TODO: add the function to add a new task
            done: 50,
            late: 50,
            numberOfTasks: 100,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => TaskListTile(
  
                task: tasks[index]),
            itemCount:tasks.length ,
          ))
        ],
      ),
    );
  }
}
