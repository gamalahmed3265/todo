import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/component/list_of_task.dart';
import 'package:todo/controller/events.dart';
import 'package:todo/model/task.dart';
import 'package:todo/services/state_renderer.dart';
import 'package:todo/services/todo.dart';

import '../controller/bloc.dart';
import '../controller/state.dart';
import 'add_task.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TasksState>(
        buildWhen: (previous, current) =>
            previous.reuestState != current.reuestState,
        builder: (ctx, state) {
          List<Task> tasksList = state.tasksList;
          return screenSwatich(
            state.reuestState,
            Scaffold(
              appBar: AppBar(actions: [
                IconButton(
                    onPressed: () {
                      TodoService todoService = TodoService();
                      todoService.deleteAllTask();
                      context.read<TaskBloc>().add(GetTaskEvents());
                    },
                    icon: const Icon(Icons.delete))
              ]),
              body: ListofTask(taskslsit: tasksList),
              floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    addTaske(ctx);
                  }),
            ),
          );
        });
  }

  void addTaske(BuildContext ctx) {
    final TextEditingController textEditingController = TextEditingController();
    showModalBottomSheet(
        context: ctx,
        builder: (context) => AddTask(
              ctx: ctx,
              textEditingController: textEditingController,
            ));
  }
}
