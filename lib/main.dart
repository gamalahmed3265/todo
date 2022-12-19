import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/controller/bloc.dart';
import 'package:todo/model/service_app.dart';
import 'package:todo/model/task.dart';
import 'package:todo/services/service.dart';
import 'package:todo/services/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/task/home.dart';
import 'package:todo/task/test_screen.dart';
import 'package:todo/task/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(ServiceAppAdapter());
  await Hive.openBox<Task>(BoxesHiveCreated.nameHive);
  await Hive.openBox<ServiceApp>(BoxesHiveCreated.nameHive2);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => ThemeCubit())],
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => TodoService()),
            RepositoryProvider(create: (context) => ServiceSettings()),
          ],
          child: BlocBuilder<ThemeCubit, bool>(builder: (ctx, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              themeMode: state == false ? ThemeMode.dark : ThemeMode.light,
              theme: ThemeManager.lightTheme,
              darkTheme: ThemeManager.darkTheme,
              home: const HomePage(),
            );
          }),
        ));
  }
}
