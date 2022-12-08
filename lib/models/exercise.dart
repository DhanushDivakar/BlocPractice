// To parse this JSON data, do
//
//     final exercise = exerciseFromJson(jsonString);

class Exercise {
  Exercise({
    required this.title,
    required this.prelude,
    required this.duration,
  });

  final String? title;
  final int? prelude;
  final int? duration;

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        title: json["title"],
        prelude: json["prelude"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "prelude": prelude,
        "duration": duration,
      };
}
