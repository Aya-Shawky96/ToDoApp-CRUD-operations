import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/task_service.dart';

class TaskProvider extends ChangeNotifier {
  TaskModel? datamodel; // Data model for storing the fetched tasks

  // Function to fetch all tasks from the service
  Future<void> getAllData() async {
    datamodel = await TaskService.getData(); // Call the service to get tasks and store them in 'data'
    notifyListeners();
  }

  // Function to add a new task to the list
  Future<void> addTask(String newTask) async {
    await TaskService.addItem(newTask: newTask);

    await getAllData();
  }

  // Function to delete a  task to the list
  Future<void> deleteTask(int id) async {
    await TaskService.deleteItem(id: id);

    await getAllData();
  }
  // Function to update a task

  Future<void> updateTask({
    required int id,
    required String title,
  }) async {

    await TaskService.updateItem(
      id: id,
      title: title,
    );

    await getAllData();
  }
}
