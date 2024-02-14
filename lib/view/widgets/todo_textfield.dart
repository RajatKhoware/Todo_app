import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controllers/notifiers/todo_provider.dart';

class TodoTextField extends StatelessWidget {
  const TodoTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final notifier = context.watch<TodoNotifier>();
    return Container(
      width: width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: TextField(
        controller: notifier.controller,
        style: GoogleFonts.poppins(
          fontSize: width / 25,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width / 12),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.2),
              width: width / 240,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width / 20),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.15),
              width: width / 240,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: width / 20,
            vertical: height / 400,
          ),
          hintText: "write your next task ",
          hintStyle: TextStyle(
            fontSize: width / 28,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        onSubmitted: (val) => notifier.addTask(),
      ),
    );
  }
}
