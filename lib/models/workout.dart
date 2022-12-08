import 'package:equatable/equatable.dart';
import 'package:flutterbloc/models/exercise.dart';

class Workout extends Equatable {
  final String? title;
  final List<Exercise> exercises;
  
  const Workout({
    required this.title,
    required this.exercises,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    List<Exercise> exercises = [];
    int index = 0;
    int startTime = 0;
    for (var ex in (json['excercises'] as Iterable)) {
      exercises.add(Exercise.fromJson(json, index, startTime));
      index++;
      startTime += exercises.last.prelude! + exercises.last.duration!;
    }
    return Workout(title: json['title'] as String?, exercises: exercises);
  }

  Map<String, dynamic> toJson() => {'title': title, 'excercises': exercises};

  @override
  List<Object?> get props => [title, exercises];

  @override
  bool get stringify => true;
}
