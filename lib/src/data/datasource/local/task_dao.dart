import 'package:manabie_todo/src/data/models/task_model.dart';

abstract class TaskDao {

  Future<List<TaskModel>> getAllTask();

  Future<List<TaskModel>> getTaskWithStatus(int status);

  Future<int> addTask(TaskModel model);

  Future<int> updateTask(TaskModel model);

  Future<int> deleteTask(int id);
}