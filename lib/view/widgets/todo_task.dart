import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controllers/notifiers/todo_provider.dart';
import 'package:to_do_app/res/mytext.dart';


class Task extends StatelessWidget {
  final int index;

  const Task({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final notifier = context.watch<TodoNotifier>();
    final task = notifier.tasksList[index];

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: height * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.015,
        horizontal: width * 0.05,
      ),
      width: width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 41, 40, 40),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => notifier.markAsComplete(index),
            child: Container(
              width: width * 0.05,
              height: height * 0.02,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: task.isCompleted ? Colors.green : Colors.transparent,
                border: Border.all(
                  color: task.isCompleted ? Colors.transparent : Colors.red,
                ),
              ),
            ),
          ),
          SizedBox(width: width * 0.02),
          SizedBox(
            width: width * 0.6,
            child: MyTextPoppines(
              text: task.title,
              fontSize: width * 0.06,
              fontWeight: FontWeight.w500,
              maxLines: 10,
              textdecoration: task.isCompleted,
            ),
          ),
          SizedBox(width: width * 0.05),
          InkWell(
            onTap: () => notifier.deleteTask(index),
            child: Icon(
              CupertinoIcons.delete_solid,
              color: const Color.fromARGB(255, 185, 184, 184),
              size: width * 0.06,
            ),
          ),
        ],
      ),
    );
  }
}
