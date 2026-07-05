class TaskModel {
  List<dynamic> result;

  TaskModel({required this.result});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      result: json["todoList"],
    );
  }
}