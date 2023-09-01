import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'constants/app_keys.dart';
import 'models/task_hive_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskHiveModelAdapter());
  await Hive.openBox<TaskHiveModel>(AppKeys.taskBase);
  await Hive.openBox<TaskHiveModel>(AppKeys.trashBase);
  runApp(const MyApp());
}
