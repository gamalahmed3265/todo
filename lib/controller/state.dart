import 'package:equatable/equatable.dart';
import 'package:todo/model/service_app.dart';
import 'package:todo/model/task.dart';
import 'package:todo/services/requrst_state.dart';

abstract class TodosState extends Equatable {
  const TodosState();
}

class TasksState extends TodosState {
  final List<Task> tasksList;
  final ReuestState reuestState;

  TasksState(
      {this.tasksList = const <Task>[],
      this.reuestState = ReuestState.loading});
  @override
  List<Object?> get props => [tasksList, reuestState];
}
