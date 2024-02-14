import 'package:flutter/cupertino.dart';

import '../models/todo.dart';

class TodoNotifier extends ChangeNotifier {
  final TextEditingController _controller = TextEditingController();
  final List<Todo> _tasks = [];

  List<Todo> get tasksList => _tasks;
  TextEditingController get controller => _controller;

  // Add Task
  void addTask() {
    if (controller.text.isNotEmpty) {
      tasksList.insert(
        0,
        Todo(
          id: tasksList.length,
          title: controller.text,
          isCompleted: false,
        ),
      );
      _controller.clear();
      notifyListeners();
    }
  }

  // Dlt Task
  void deleteTask(int index) {
    tasksList.removeAt(index);
    notifyListeners();
  }

  // Mark as Completed
  void markAsComplete(int id) {
    if (id >= 0 && id < tasksList.length) {
      tasksList[id].isCompleted = !tasksList[id].isCompleted;
      notifyListeners();
    }
  }
}
