import 'package:hive/hive.dart';
import 'package:todo/model/service_app.dart';
import 'package:todo/model/task.dart';

class BoxesHiveCreated {
  static const String nameHive = "transactions";
  static Box<Task> getTransactions() => Hive.box<Task>(nameHive);
  static const String nameHive2 = "serviceApp";
  static Box<ServiceApp> getTransactionsService() =>
      Hive.box<ServiceApp>(nameHive2);
}

class TodoService {
  final Box<Task> _tasks = BoxesHiveCreated.getTransactions();

  Future<void> init() async {
    // Hive.registerAdapter(TaskAdapter());
    // _tasks = await Hive.openBox<Task>(BoxesHiveCreated.nameHive);

    await _tasks.add(Task(
        title: "task 1",
        description: "",
        isSelected: false,
        isDone: false,
        date: "",
        startTime: "",
        endTime: "",
        reminder: "",
        repeat: "",
        color: ""));
    await _tasks.add(Task(
        title: "task 2",
        description: "",
        isSelected: true,
        isDone: false,
        date: "",
        startTime: "",
        endTime: "",
        reminder: "",
        repeat: "",
        color: ""));
  }

  void deleteAllTask() async {
    await _tasks.clear();
  }

  List<Task> getTasks() {
    final tasks = _tasks.values;
    return tasks.toList();
  }

  void addTask(final Task task) {
    _tasks.add(Task(
        title: task.title,
        description: task.description,
        isSelected: task.isSelected,
        isDone: task.isDone,
        date: task.date,
        startTime: task.startTime,
        endTime: task.endTime,
        reminder: task.reminder,
        repeat: task.repeat,
        color: task.color));
  }

  Future<void> removeTask(final String date) async {
    final taskToRemove =
        _tasks.values.firstWhere((element) => element.date == date);
    await taskToRemove.delete();
  }

  Future<void> updateTask(
    final Task task,
  ) async {
    final taskToEdit =
        _tasks.values.firstWhere((element) => element.date == task.date);
    final index = taskToEdit.key as int;
    await _tasks.put(index, task);
  }
}
