import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final bool isSelected;
  @HiveField(3)
  final bool isDone;
  @HiveField(4)
  final String date;
  @HiveField(5)
  final String startTime;
  @HiveField(6)
  final String endTime;
  @HiveField(7)
  final String reminder;
  @HiveField(8)
  final String repeat;
  @HiveField(9)
  final String color;

  Task(
      {required this.title,
      required this.description,
      required this.isSelected,
      required this.isDone,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.reminder,
      required this.repeat,
      required this.color});
}
