import 'package:equatable/equatable.dart';
import 'package:todo/model/service_app.dart';
import 'package:todo/model/task.dart';

abstract class TasksEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetTaskEvents extends TasksEvents {
  GetTaskEvents();

  @override
  List<Object?> get props => [];
}

class AddTaskEvents extends TasksEvents {
  final Task task;

  AddTaskEvents({required this.task});

  @override
  List<Object?> get props => [task];
}

class UpdateTaskEvents extends TasksEvents {
  final Task task;

  UpdateTaskEvents({required this.task});
  @override
  List<Object?> get props => [task];
}

class DeleteTaskEvents extends TasksEvents {
  final Task task;

  DeleteTaskEvents({required this.task});
  @override
  List<Object?> get props => [task];
}
