import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/blocs/workouts_cubit.dart';
import 'package:flutterbloc/helpers/helpers.dart';
import 'package:flutterbloc/models/workout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Workout Time"), actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.event),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
      ]),
      body: SingleChildScrollView(
          child: BlocBuilder<WorkoutsCubit, List<Workout>>(
        builder: (context, workouts) {
          return ExpansionPanelList.radio(
            children: workouts
                .map(
                  (workout) => ExpansionPanelRadio(
                    value: workout,
                    headerBuilder: (BuildContext context, bool isExpanded) =>
                         ListTile(
                      visualDensity: const VisualDensity(
                          horizontal: 0,
                          vertical: VisualDensity.maximumDensity),
                          leading: IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
                          title: Text(workout.title ?? ''),
                           trailing: Text(formatTime(workout.getTotal(), true)),
                    ),
                    body: ListView.builder(
                      shrinkWrap: true,
                      itemCount: workout.exercises.length,
                    itemBuilder: (BuildContext context,int index) {
                      return ListTile(
                        onTap: null,
                      visualDensity: const VisualDensity(
                          horizontal: 0,
                          vertical: VisualDensity.maximumDensity),
                          leading: Text(formatTime(workout.exercises[index].prelude ?? 0, true)),
                          title: Text(workout.exercises[index].title  ?? '' ),
                          trailing: Text(formatTime(workout.exercises[index].duration ?? 0, true)),
                         
                    );
                      

                    },
                    ),
                  ),
                )
                .toList(),
          );
        },
      )),
    );
  }
}
