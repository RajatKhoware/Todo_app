import '../models/todo.dart';
import 'package:flutter/cupertino.dart';

class TodoNotifier extends ChangeNotifier {
  final TextEditingController _controller = TextEditingController();
  final List<Todo> _tasks = [];

  List<Todo> get tasksList => _tasks;
  TextEditingController get controller => _controller;

  /// Adds a new task to the beginning of the tasks list.
  /// The task is created using the text from the controller.
  /// The controller is then cleared, and listeners are notified.
  void addTask() {
    if (_controller.text.isNotEmpty) {
      _tasks.insert(
        0,
        Todo(
          id: _tasks.length,
          title: _controller.text,
          isCompleted: false,
        ),
      );
      _controller.clear();
      notifyListeners();
    }
  }

  /// Deletes a task at the specified index from the tasks list.
  /// Listeners are notified after the task is removed.
  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  /// Toggles the completion status of a task with the given id.
  /// If the id is valid, the isCompleted flag of the corresponding task is toggled.
  /// Listeners are notified after the task is updated.
  void markAsComplete(int id) {
    if (id >= 0 && id < _tasks.length) {
      _tasks[id].isCompleted = !_tasks[id].isCompleted;
      notifyListeners();
    }
  }
}