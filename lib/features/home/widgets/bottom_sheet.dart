import 'package:flutter/material.dart';
import 'package:project/core/models/task.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _taskDateController = TextEditingController();
  final TextEditingController _impDateController = TextEditingController();
  String _priority = 'High';
  String _status = 'Pending';
  int _categoryID = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Task Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter task name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter description';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _taskDateController,
              decoration: const InputDecoration(labelText: 'Task Date'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter task date';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _impDateController,
              decoration: const InputDecoration(labelText: 'Finishing Date'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter important date';
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
              value: _priority,
              decoration: const InputDecoration(labelText: 'Priority'),
              items: ['High', 'Medium', 'Low'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _priority = newValue!;
                });
              },
            ),
            DropdownButtonFormField<String>(
              value: _status,
              decoration: const InputDecoration(labelText: 'Status'),
              items: ['Pending', 'In Progress', 'Completed'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _status = newValue!;
                });
              },
            ),
            DropdownButtonFormField<int>(
              value: _categoryID,
              decoration: const InputDecoration(labelText: 'Category'),
              items: [1, 2, 3].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('Category $value'),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _categoryID = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Add task logic here
                  final newTask = Tasks(
                    id: DateTime.now().millisecondsSinceEpoch,
                    name: _nameController.text,
                    decription: _descriptionController.text,
                    taskDate: _taskDateController.text,
                    categoryID: _categoryID,
                    priority: _priority,
                    status: _status,
                    isActive: 1,
                    impDate: _impDateController.text,
                  );
                  // Add the new task to your task list
                  // For example: taskList.add(newTask);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}