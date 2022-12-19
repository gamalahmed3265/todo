import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/controller/bloc.dart';
import 'package:todo/controller/events.dart';
import 'package:todo/model/service_app.dart';
import 'package:todo/services/todo.dart';
import 'package:todo/task/task_page.dart';
import 'package:todo/task/test_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final TodoService todoService = TodoService();
final ServiceApp serviceApp = ServiceApp(theme: "", language: "ar");

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TaskBloc>(
            create: (context) => TaskBloc(todoService)..add(GetTaskEvents()),
          ),
          BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        ],

        //  child: const TaskScreen());
        child: const TestScreen());
  }
}
