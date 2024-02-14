import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controllers/notifiers/todo_provider.dart';
import 'package:to_do_app/view/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => TodoNotifier(),
        child: const HomeScreen(),
      ),
    );
  }
}
