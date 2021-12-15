import 'package:manabie_todo/src/data/models/task_model.dart';

abstract class TaskRepository {

  Future<List<TaskModel>> getAllTasks();

  Future<List<TaskModel>> getTasksByStatus(int status);

  Future<int> addTask(TaskModel taskModel);

  Future<int> updateTask(TaskModel taskModel);

  Future<int> deleteTask(int id);
}