
class TodoModel {
  final int? id;
  final String title;
  final String description;
  final String date;
  final String priority;
  final int isCompleted;

  TodoModel({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.priority,
    required this.isCompleted,
  });
}
