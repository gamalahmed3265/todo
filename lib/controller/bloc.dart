import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:todo/controller/events.dart';
import 'package:todo/controller/state.dart';
import 'package:todo/model/service_app.dart';
import 'package:todo/model/task.dart';
import 'package:todo/model/task_extention.dart';
import 'package:todo/services/requrst_state.dart';
import 'package:todo/services/todo.dart';
import 'package:todo/task/theme.dart';

class TaskBloc extends Bloc<TasksEvents, TasksState> {
  TodoService todoService;
  TaskBloc(this.todoService) : super(TasksState()) {
    on<GetTaskEvents>(getTaks);
    on<AddTaskEvents>(addTaks);
    on<UpdateTaskEvents>(updateTask);
  }

  FutureOr<void> getTaks(GetTaskEvents event, Emitter<TasksState> emit) async {
    emit(TasksState(reuestState: ReuestState.loading));

    List<Task> allTask = todoService.getTasks();
    emit(TasksState(reuestState: ReuestState.loaded, tasksList: allTask));
  }

  FutureOr<void> addTaks(AddTaskEvents event, Emitter<TasksState> emit) async {
    emit(TasksState(reuestState: ReuestState.loading));
    final state = this.state;
    final task = event.task;

    todoService.addTask(task);
    // allTask.add(task);
    print(task.title);
    List<Task> allTask = todoService.getTasks();
    emit(TasksState(reuestState: ReuestState.loaded, tasksList: allTask));
  }

  FutureOr<void> updateTask(
      UpdateTaskEvents event, Emitter<TasksState> emit) async {
    emit(TasksState(reuestState: ReuestState.loading));
    final state = this.state;
    final task = event.task;
    todoService.updateTask(task);
    print(task.title);
    List<Task> allTask = todoService.getTasks();
    emit(TasksState(reuestState: ReuestState.loaded, tasksList: allTask));
  }

  FutureOr<void> deleteTask(
      DeleteTaskEvents event, Emitter<TasksState> emit) async {
    emit(TasksState(reuestState: ReuestState.loading));
    final state = this.state;
    final task = event.task;

    List<Task> allTask = List.from(state.tasksList)..remove(task);

    todoService.removeTask(task.date);
    emit(TasksState(
      tasksList: allTask,
      reuestState: ReuestState.loaded,
    ));
  }
}

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);
  void toggle({required bool value}) {
    // print(value);
    emit(value);
  }
}
