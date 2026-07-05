import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/screens/update_task_screen.dart';
import '../providers/task-provider.dart';
import '../widgets/task_tile.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[400], // Background color for the main screen
      body: Container(
        padding: const EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20,
            bottom: 20), // Padding around the body content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row with Icon and App Title
            const Row(
              children: [
                Icon(Icons.playlist_add_check, size: 40, color: Colors.white),
                Text(
                  "ToDayDo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // Displaying total number of tasks
            Consumer<TaskProvider>(
              builder: (context, taskObject, child) {
                final total = taskObject.datamodel?.result.length ?? 0;
                return Text(
                  "$total Tasks", // Show total tasks count
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                );
              },
            ),
            const SizedBox(height: 20), // Spacing between elements

            // Main task list container
            Expanded(
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),

                // Consumer to get the tasks list from TaskProvider
                child: Consumer<TaskProvider>(
                    builder: (context, taskObject, child) {
                      final tasks = taskObject.datamodel?.result; // List of tasks

// If tasks are null, fetch data and show a loading spinner
                  if (tasks == null) {
                    taskObject.getAllData();
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    // Build a list of tasks if data is available
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskTile(
                          taskTitle: tasks[index]["title"],

                          onEdit: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) {
                                print(tasks[index]["id"]);
                                return UpdateTask(
                                  id: tasks[index]["id"],
                                  oldTitle: tasks[index]["title"],
                                );
                              },
                            );
                          },

                          onDelete: () {
                            taskObject.deleteTask(
                              tasks[index]["id"],
                            );
                          },
                        );
                      },
                    );
                  }
                }),
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button to open the add task screen
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show the modal bottom sheet for adding a new task
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddTask();
            },
          );
        },
        backgroundColor: Colors.red[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
