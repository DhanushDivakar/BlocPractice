
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/tasks_bloc.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
   AddTaskScreen({
    Key? key,
   
  }) : super(key: key);

   

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        const Text(
          'Add Task',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          
          autofocus: true,
          decoration: const InputDecoration(
            label: Text('Title'),
            border: OutlineInputBorder(),
          ),
          controller: titleController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
             ElevatedButton(onPressed: () {
          var task = Task(title: titleController.text);
          context.read<TasksBloc>().add(AddTask(task: task));
          Navigator.pop(context);
        }, child: const Text("Add"))
          ],
        ),
       
      ]),
    );
  }
}