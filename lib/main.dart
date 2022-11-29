import 'package:flutter/material.dart';
import 'package:flutterbloc/models/task.dart';
import 'package:flutterbloc/screens/task_screen.dart';

import 'blocs/bloc_exports.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
}
//hiiii

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()..add(AddTask(task: Task(title: 'Task1'))),
      child: MaterialApp(
        title: 'Flutter Tasks App',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: TasksScreen(),
      ),
    );
  }
}
