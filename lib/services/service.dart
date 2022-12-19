import 'package:hive/hive.dart';
import 'package:todo/model/service_app.dart';
import 'package:todo/services/todo.dart';

class ServiceSettings {
  final Box<ServiceApp> _service = BoxesHiveCreated.getTransactionsService();

  Future<void> init() async {
    await _service.add(ServiceApp(theme: "theme", language: "language"));
  }

  void deleteAllSevice() async {
    await _service.clear();
  }

  ServiceApp getSevice() {
    return _service.values.first;
  }

  void addSevice(final ServiceApp serviceApp) {
    _service.add(
        ServiceApp(theme: serviceApp.theme, language: serviceApp.language));
  }

  // Future<void> updateSevice(
  //   final ServiceApp Sevice,
  // ) async {
  //   final SeviceToEdit =
  //       _service.values.firstWhere((element) => element.date == Sevice.date);
  //   final index = SeviceToEdit.key as int;
  //   await _service.put(index, Sevice);
  // }
}
