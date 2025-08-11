// lib/models/task_model.dart

import 'dart:convert';

class Task {
  String id;
  String title;
  bool isDone;

  Task({required this.id, required this.title, this.isDone = false});

  // Converts a Task object into a simple map
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "isDone": isDone,
      };

  // Creates a Task object from a map
  factory Task.fromMap(Map<String, dynamic> map) => Task(
        id: map["id"],
        title: map["title"],
        isDone: map["isDone"],
      );

  // Converts a Task object into a JSON string
  String toJson() => json.encode(toMap());

  // Creates a Task object from a JSON string
  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}
