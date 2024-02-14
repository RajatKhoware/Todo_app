import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controllers/notifiers/todo_provider.dart';
import 'package:to_do_app/res/mytext.dart';
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
     final mediaQuery = MediaQuery.of(context);
    final double height = mediaQuery.size.height;
    final double width = mediaQuery.size.width;
    final notifier = context.watch<TodoNotifier>();
    final task = notifier.tasksList;
    final completedTask = task.where((task) => task.isCompleted).length;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      width: width,
      height: height * 0.23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.08),
              MyTextPoppines(
                text: "Todo Done",
                fontSize: width * 0.06,
                fontWeight: FontWeight.w600,
              ),
              const MyTextPoppines(text: "Keep it up..!"),
            ],
          ),
          CircleAvatar(
            radius: width * 0.15,
            backgroundColor: Colors.red,
            child: MyTextPoppines(
              text: "$completedTask/${task.length}",
              fontSize: width * 0.08,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
