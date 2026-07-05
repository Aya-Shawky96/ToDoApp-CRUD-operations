import 'package:dio/dio.dart';
import '../models/task_model.dart';

class TaskService {
  static Dio dio = Dio(); // Create a Dio instance for handling HTTP requests

  // Function to fetch tasks data from the API
  static Future<TaskModel> getData() async {
    Response response = await dio.get(
      "https://mytodoapi.runasp.net/api/TodoItems/",
    );

    return TaskModel.fromJson(response.data);
  }

// Function to add a new task with the provided task description
  static Future<void> addItem({required String newTask}) async {
    await dio.post(
      "https://mytodoapi.runasp.net/api/TodoItems/",
      data: {
        "title": newTask,
      },
    );
  }

//Function to delete task with id
  static Future<void> deleteItem({required int id}) async {
    await dio.delete(
      "https://mytodoapi.runasp.net/api/TodoItems/$id",
    );
  }

  //Function to update  task with id
  static Future<void> updateItem({
    required int id,
    required String title,
  }) async {
    await dio.put(
      "https://mytodoapi.runasp.net/api/TodoItems/$id",
      data: {
        "title": title,
      },
    );
  }
}
