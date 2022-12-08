import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/blocs/workouts_cubit.dart';

void main() {
  ()=>runApp(const WorkoutTime());
}


class WorkoutTime extends StatelessWidget {
  const WorkoutTime({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Workouts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black)
        ) 
      ),
      home: BlocProvider<WorkoutsCubit>(create: (BuildContext context){
        WorkoutsCubit workoutsCubit = WorkoutsCubit();
        if(workoutsCubit.state.isEmpty){
          workoutsCubit.getWorkOuts();
        }
        return workoutsCubit;


      }),
    );
  }
}