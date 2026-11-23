import 'package:dio/dio.dart';
import '../models/task_model.dart';

class TaskService {
  static Dio dio = Dio(); // Create a Dio instance for handling HTTP requests

  // Function to fetch tasks data from the API
  static Future<TasksModel> getData() async {
    try {
      Response response = await dio.get(
        "https://mytodoapi.runasp.net/api/TodoItems/",
      );

      return TasksModel.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception("Failed to fetch data: ${dioError.message}");
    } catch (error) {
      throw Exception("An unexpected error occurred: ${error.toString()}");
    }
  }

  // Function to add a new task with the provided task description
  static Future<void> addItem({required String newTask}) async {
    try {
      await dio.post(
        "https://mytodoapi.runasp.net/api/TodoItems/",
        data: {"title": newTask},
      );
    } on DioException catch (dioError) {
      throw Exception("Failed to add task: ${dioError.message}");
    } catch (error) {
      throw Exception("An unexpected error occurred: ${error.toString()}");
    }
  }

  //Function to delete task with id
  static Future<void> deleteItem({required int id}) async {
    try {
      await dio.delete("https://mytodoapi.runasp.net/api/TodoItems/$id");
    } on DioException catch (dioError) {
      throw Exception("Failed to delete task: ${dioError.message}");
    } catch (error) {
      throw Exception("An unexpected error occurred: ${error.toString()}");
    }
  }

  //Function to update  task with id
  static Future<void> updateItem({
    required int id,
    required String title,
  }) async {
    try {
      await dio.put(
        "https://mytodoapi.runasp.net/api/TodoItems/$id",
        data: {"title": title},
      );
    } on DioException catch (dioError) {
      throw Exception("Failed to update task: ${dioError.message}");
    } catch (error) {
      throw Exception("An unexpected error occurred: ${error.toString()}");
    }
  }
}
