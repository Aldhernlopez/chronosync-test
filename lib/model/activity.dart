import 'package:isar/isar.dart';

part 'activity.g.dart';

@Collection()
class Activity{
  Id id = Isar.autoIncrement;
  String? title;
  String? details;
  String? category;
  DateTime? date;
}