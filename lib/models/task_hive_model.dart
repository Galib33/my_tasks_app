// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'task_hive_model.g.dart';

@HiveType(typeId: 1)
class TaskHiveModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String subtitle;

  @HiveField(3)
  bool isChecked;

  @HiveField(4)
  DateTime dateTime;

  @HiveField(5)
  bool? isSeen=false;


  TaskHiveModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.isChecked,
    required this.dateTime,
    this.isSeen=false,
  });

 
}
