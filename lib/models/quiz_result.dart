import 'package:hive/hive.dart';

part 'quiz_result.g.dart'; // REQUIRED for Hive code generation

@HiveType(typeId: 1)
class QuizResult extends HiveObject {
  @HiveField(0)
  int score;

  @HiveField(1)
  DateTime takenAt;

  @HiveField(2)
  List<int> answers;

  QuizResult({required this.score, required this.answers, DateTime? takenAt})
    : takenAt = takenAt ?? DateTime.now();
}
