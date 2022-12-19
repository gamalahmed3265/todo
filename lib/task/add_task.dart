import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/model/task.dart';

import '../controller/bloc.dart';
import '../controller/events.dart';

// ignore: must_be_immutable
class AddTask extends StatelessWidget {
  AddTask({Key? key, required this.textEditingController, required this.ctx})
      : super(key: key);
  final TextEditingController textEditingController;
  BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          TextField(
            controller: textEditingController,
            autofocus: true,
            decoration: const InputDecoration(
                label: Text("Add Task"), border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text("Cancel")),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    var task = Task(
                        title: textEditingController.text,
                        description: "",
                        isSelected: false,
                        isDone: false,
                        date: DateTime.now().toString(),
                        startTime: "",
                        endTime: "",
                        reminder: "",
                        repeat: "",
                        color: "");
                    ctx.read<TaskBloc>().add(AddTaskEvents(task: task));

                    // Navigator.of(context).pop();
                  },
                  child: const Text("Add")))
        ],
      ),
    );
  }
}
