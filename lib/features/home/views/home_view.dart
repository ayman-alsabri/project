import 'package:flutter/material.dart';

import 'package:project/core/scaffolds/drawer_scaffold.dart';
import 'package:project/features/home/widgets/circular_main_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      title: 'Home',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularMainButton(
            done: 50,
            late: 50,
            numberOfTasks: 100,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(16),
              height: 20,
              width: 20,
              // color: Colors.red,
              child: Text(index.toString()),
            ),
            itemCount: 5,
          ))
        ],
      ),
    );
  }
}
