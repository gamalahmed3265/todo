import 'package:hive/hive.dart';

part 'service_app.g.dart';

@HiveType(typeId: 1)
class ServiceApp extends HiveObject {
  @HiveField(0)
  final String theme;
  @HiveField(1)
  final String language;
  ServiceApp({required this.theme, required this.language});
}
