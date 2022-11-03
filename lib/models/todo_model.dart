class TodoFields {
  static String id = "id";
  static String title = "title";
  static String description = "description";
  static String date = "date";
  static String priority = "priority";
  static String isCompleted = "isCompleted";
}

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

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'priority': priority,
      'isCompleted': isCompleted,
    };
  }
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] ?? -1,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      date: json['date'] ?? '',
      priority: json['priority'] ?? '',
      isCompleted: json['isCompleted'] ?? -1,
    );
  }
    TodoModel copyWith({
    int? id,
    String? title,
    String? description,
    String? date,
    String? priority,
    int? isCompleted,
  }) =>
      TodoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        priority: priority ?? this.priority,
        isCompleted: isCompleted ?? this.isCompleted,
      );
}
