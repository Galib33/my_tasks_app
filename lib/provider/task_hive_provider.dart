import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../models/task_hive_model.dart';

class TaskHiveProvider extends ChangeNotifier {
  Box<TaskHiveModel> taskBox = Hive.box<TaskHiveModel>("Task Base");

  Box<TaskHiveModel> trashBox = Hive.box<TaskHiveModel>("Trash Base");

  bool bottomCheck = false;
  int? itemIndex;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  String? validateCheck(String? value) {
    if (value == "" || value == null) {
      return "Empty Field";
    }
    return null;
  }

  Map<String, TextEditingController> controllers = {
    "title": TextEditingController(),
    "subtitle": TextEditingController(),
    "search": TextEditingController()
  };

  ValueNotifier<String> searchNotifier = ValueNotifier("");

  final _idGenerator = const Uuid();

  void addTask(BuildContext context) async {
    if (globalFormKey.currentState!.validate()) {
      String randomID = _idGenerator.v1();
      await taskBox.put(
          randomID,
          TaskHiveModel(
              id: randomID,
              title: controllers["title"]!.text,
              subtitle: controllers["subtitle"]!.text,
              isChecked: bottomCheck,
              dateTime: DateTime.now()));
      clearFields();
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
    return;
  }

  List<TaskHiveModel> getMainList(
      {required bool isTrash,
      required String value,
      required Box<TaskHiveModel> box}) {
    return isTrash
        ? box.values.toList()
        : box.values
            .toList()
            .where((element) => element.title.contains(value))
            .toList();
  }

  void clearFields() {
    for (TextEditingController element in controllers.values) {
      if (element != controllers["search"]) {
        element.clear();
      }
    }
    bottomCheck = false;
  }

  ValueListenable<Box<TaskHiveModel>> get taskBoxListenable =>
      taskBox.listenable();
  ValueListenable<Box<TaskHiveModel>> get trashBoxListenable =>
      trashBox.listenable();

  bool getTaskChecked(String taskKey, bool isTrash) {
    if (isTrash) {
      return trashBox.get(taskKey)?.isChecked ?? false;
    }
    return taskBox.get(taskKey)?.isChecked ?? false;
  }

  void updateChecked(
    bool value, {
    required bool isTrash,
    required TaskHiveModel oldModel,
  }) async {
    if (!isTrash) {
      oldModel.isChecked = value;

      await taskBox.put(oldModel.id, oldModel);
    }
  }

  void editTask(context, TaskHiveModel model) async {
    if (globalFormKey.currentState!.validate()) {
      model.title = controllers["title"]!.text;
      model.subtitle = controllers["subtitle"]!.text;
      await taskBox.put(model.id, model); //!
    }
  }

  void deleteTask(context, TaskHiveModel taskHiveModel) async {
    await trashBox.put(taskHiveModel.id, taskHiveModel);
    await taskBox.delete(taskHiveModel.id);
  }

  int countIsNotSeen(Box<TaskHiveModel> box) {
    int count = 0;
    for (TaskHiveModel element in box.values) {
      if (element.isSeen == false) {
        count++;
      }
    }
    return count;
  }

  void setSeenTrue() async {
    for (var key in trashBox.keys) {
      TaskHiveModel model = trashBox.get(key)!;
      model.isSeen = true;
      await trashBox.put(key, model);
    }
  }

  void deleteAllTrahes() async {
    await trashBox.clear();
  }

  void undoTrashTask(context, TaskHiveModel taskHiveModel) async {
    taskHiveModel.isSeen = false;
    await taskBox.put(taskHiveModel.id, taskHiveModel);
    await trashBox.delete(taskHiveModel.id);
  }

  @override
  void dispose() {
    for (TextEditingController controller in controllers.values) {
      controller.dispose();
    }
    taskBoxListenable.removeListener(() {});
    trashBoxListenable.removeListener(() {});
    super.dispose();
  }
}
