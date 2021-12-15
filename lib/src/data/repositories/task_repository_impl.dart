import 'package:manabie_todo/src/data/datasource/local/task_database.dart';
import 'package:manabie_todo/src/data/models/task_model.dart';
import 'package:manabie_todo/src/domain/repositories/task_repository.dart';

class TaskRepositoryImplement implements TaskRepository {

  final TaskDatabase _taskDatabase;

  const TaskRepositoryImplement(this._taskDatabase);

  @override
  Future<int> addTask(TaskModel taskModel) {
    return _taskDatabase.addTask(taskModel);
  }

  @override
  Future<int> deleteTask(int id) {
    return _taskDatabase.deleteTask(id);
  }

  @override
  Future<List<TaskModel>> getAllTasks() {
    return _taskDatabase.getAllTask();
  }

  @override
  Future<List<TaskModel>> getTasksByStatus(int status) {
    return _taskDatabase.getTaskWithStatus(status);
  }

  @override
  Future<int> updateTask(TaskModel taskModel) {
    return _taskDatabase.updateTask(taskModel);
  }
}