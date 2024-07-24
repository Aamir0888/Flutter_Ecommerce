// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

List<Task> taskFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  int id;
  String title;
  String description;
  int time;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "time": time,
  };
}