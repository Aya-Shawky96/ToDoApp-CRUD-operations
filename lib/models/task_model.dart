class Task {
  final int id;
  final String title;
  final String description;
  final String status;
  final String createdAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
  });
}

class TasksModel {
  final List<Task> result;
  final String message;
  final bool status;

  TasksModel({
    required this.result,
    required this.message,
    required this.status,
  });

  factory TasksModel.fromJson(Map<String, dynamic> json) {
    final tempResult = json['todoList']
        .map<Task>(
          (item) => Task(
            id: item['id'],
            title: item['title'] ?? '',
            description: item['description'] ?? '',
            status: item['status'] ?? '',
            createdAt: item['createdAt'] ?? '',
          ),
        )
        .toList();
    return TasksModel(
      result: tempResult,
      message: json['message'],
      status: json['status'],
    );
  }
}
