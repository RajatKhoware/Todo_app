import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controllers/notifiers/todo_provider.dart';
import 'package:to_do_app/res/mytext.dart';

import '../widgets/todo_header.dart';
import '../widgets/todo_task.dart';
import '../widgets/todo_textfield.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final notifier = context.watch<TodoNotifier>();
    final tasks = notifier.tasksList;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.02,
            horizontal: width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              SizedBox(height: height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const TodoTextField(),
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
              tasks.isEmpty
                  ? SizedBox(height: height * 0.2)
                  : SizedBox(height: height * 0.02),
              tasks.isEmpty
                  ? Center(
                      child: MyTextPoppines(
                        text: "No taks found",
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
