import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task-provider.dart';

class UpdateTask extends StatelessWidget {
  final int id;
  final String oldTitle;

  UpdateTask({
    super.key,
    required this.id,
    required this.oldTitle,
  });

  @override
  Widget build(BuildContext context) {
    String newTitle = oldTitle;

    final taskObject =
    Provider.of<TaskProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Update Task",
            style: TextStyle(
              fontSize: 30,
              color: Colors.teal[400],
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          TextField(
            controller: TextEditingController(text: oldTitle),
            onChanged: (value) {
              newTitle = value;
            },
          ),

          const SizedBox(height: 20),

          TextButton(
            onPressed: () {
              if (newTitle.trim().isNotEmpty) {
                taskObject.updateTask(
                  id: id,
                  title: newTitle,
                );
              }

              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal,
            ),
            child: const Text(
              "Update",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}