import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controllers/models/todo.dart';
import 'package:to_do_app/controllers/notifiers/todo_provider.dart';
import 'package:to_do_app/res/mytext.dart';

import '../widgets/todo_header.dart';
import '../widgets/todo_task.dart';
import '../widgets/todo_textfield.dart';

/// This code defines the HomeScreen class, which is a StatelessWidget representing the home screen of an app.
/// It displays a header, a text field for adding tasks, and a list of tasks.
/// The tasks are managed by a TodoNotifier, which is obtained using the context.
/// If there are no tasks, a message is displayed indicating that no tasks are found.
/// Otherwise, the tasks are displayed in a ListView using the Task widget.

class HomeScreen extends StatelessWidget {
  static const headerWidget = Header();
  static const textFieldWidget = TodoTextField();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen
    final mediaQuery = MediaQuery.of(context);
    final double height = mediaQuery.size.height;
    final double width = mediaQuery.size.width;

    // Get the list of tasks from the provider
    final TodoNotifier notifier = context.watch<TodoNotifier>();
    final List<Todo> tasks = notifier.tasksList;

    // Check if there are any tasks
    final bool isTasksEmpty = tasks.isEmpty;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.02,
            horizontal: width * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the header
              headerWidget,
              SizedBox(height: height * 0.04),

              // Display the text field and add button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  textFieldWidget,
                  InkWell(
                    onTap: () => notifier.addTask(),
                    child: CircleAvatar(
                      radius: width * 0.06,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: width * 0.06,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: isTasksEmpty ? height * 0.2 : height * 0.02),

              // Display the list of tasks or a message if there are no tasks
              isTasksEmpty
                  ? Center(
                      child: MyTextPoppines(
                        text: "No tasks found",
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) => Task(index: index),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}