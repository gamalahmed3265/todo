import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/model/task.dart';

import '../controller/bloc.dart';
import '../controller/events.dart';

class ListofTask extends StatelessWidget {
  const ListofTask({
    Key? key,
    required this.taskslsit,
  }) : super(key: key);

  final List<Task> taskslsit;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: taskslsit.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(taskslsit[index].title),
              subtitle: Text(taskslsit[index].date),
              trailing: Checkbox(
                  value: taskslsit[index].isDone,
                  onChanged: (value) {
                    context
                        .read<TaskBloc>()
                        .add(UpdateTaskEvents(task: taskslsit[index]));
                  }),
              onLongPress: () => context
                  .read<TaskBloc>()
                  .add(DeleteTaskEvents(task: taskslsit[index])),
            ));
  }
}
