import 'package:flutter/material.dart';
import 'package:flutterbloc/screens/task_screen.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//
  

  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}
//hiiii

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Tasks App',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: const TasksScreen(),
      ),
    );
  }
}
