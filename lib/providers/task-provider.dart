import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/task_service.dart';

class TaskProvider extends ChangeNotifier {
  TasksModel? datamodel;

  Future<void> getAllData() async {
    datamodel = await TaskService.getData();
    notifyListeners();
  }

  Future<void> addTask(String newTask) async {
    await TaskService.addItem(newTask: newTask);

    await getAllData();
  }

  Future<void> deleteTask(int id) async {
    await TaskService.deleteItem(id: id);

    await getAllData();
  }

  Future<void> updateTask({required int id, required String title}) async {
    await TaskService.updateItem(id: id, title: title);

    await getAllData();
  }
}
