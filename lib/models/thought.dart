import 'package:hive/hive.dart';
part 'thought.g.dart';

@HiveType(typeId: 0)
class Thought extends HiveObject {
  @HiveField(0)
  String text;

  @HiveField(1)
  String? author;

  @HiveField(2)
  DateTime fetchedAt;

  Thought({required this.text, this.author, DateTime? fetchedAt})
    : fetchedAt = fetchedAt ?? DateTime.now();
}
