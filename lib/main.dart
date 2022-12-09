import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/blocs/workouts_cubit.dart';
import 'package:flutterbloc/models/workout.dart';
import 'package:flutterbloc/screens/home_page.dart';

void main() {
   runApp(const WorkoutTime());
}

class WorkoutTime extends StatelessWidget {
  const WorkoutTime({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Workouts',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme:
              const TextTheme(bodyText2: TextStyle(color: Colors.brown))),
      home: BlocProvider<WorkoutsCubit>(
        create: (BuildContext context) {
          print('hii');
          WorkoutsCubit workoutsCubit = WorkoutsCubit();
          if (workoutsCubit.state.isEmpty) {
            workoutsCubit.getWorkOuts();
          }
          return workoutsCubit;
        },
        child: BlocBuilder<WorkoutsCubit, List<Workout>>(
          builder: (context, state) {
            print('hi');
            return const HomePage();
          },
        ),
      ),
    );
  }
}
